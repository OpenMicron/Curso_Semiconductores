#!/bin/bash -i

# Exit immediately if a command fails
set -e

set +H

if [ "$#" -lt 1 ]; then
    echo "Usage: $0 <path/to/cell_name.gds>"
    echo "Example: $0 ./2_nor1X/2_nor1X.gds"
    exit 1
fi

# 1. Parse the input path
TARGET_INPUT=$1
WORK_DIR=$(dirname "$TARGET_INPUT")
BASE_INPUT=$(basename "$TARGET_INPUT")

# Strip '.gds' to isolate the cell name
CELL_NAME=${BASE_INPUT%.gds}

echo "========================================"
echo " Directory : $WORK_DIR"
echo " Cell Name : $CELL_NAME"
echo "========================================"

# 2. Safely navigate to the target directory
cd "$WORK_DIR" || { echo "Error: Cannot access directory $WORK_DIR"; exit 1; }

GDS_FILE="${CELL_NAME}.gds"
LVS_FILE="${CELL_NAME}.spice"
PEX_FILE="${CELL_NAME}_pex.spice"

# 3. Check for required files
if [ ! -f "$GDS_FILE" ]; then
    echo "Error: Could not find GDS file ($GDS_FILE) in $WORK_DIR."
    exit 1
fi

if [ ! -f "$LVS_FILE" ]; then
    echo "Error: Could not find LVS netlist ($LVS_FILE) in $WORK_DIR to extract ports."
    exit 1
fi

# 4. Extract golden port order from LVS
SUBCKT_LINE=$(grep -i "^\.subckt" "$LVS_FILE" | head -n 1)

if [ -z "$SUBCKT_LINE" ]; then
    echo "Error: Could not find a .subckt definition in $LVS_FILE."
    exit 1
fi

GOLDEN_PORTS=$(echo "$SUBCKT_LINE" | awk '{$1=""; $2=""; print $0}' | xargs)
echo "Found LVS Port Order: $GOLDEN_PORTS"

# 5. Clean up stale Magic files
rm -f ${CELL_NAME}*.ext ${CELL_NAME}*.sim ${CELL_NAME}*.nodes

# 6. Generate Tcl script
TCL_SCRIPT="run_magic_pex_${CELL_NAME}.tcl"
cat <<EOF > $TCL_SCRIPT
gds flatten yes
gds read $GDS_FILE
load ${CELL_NAME}
select top cell

extract all
ext2sim labels on
ext2sim

extresist tolerance 0.1
extresist all

ext2spice extresist on
ext2spice cthresh 0.01 rthresh 0.01
ext2spice subcircuit top on
ext2spice -o $PEX_FILE

quit
EOF

# 7. Setup Environment and Run Magic
echo "========================================"
echo "Loading SKY130A enviornment"
sak-pdk sky130A
echo "========================================"
echo "Running Magic extraction engine..."
magic -dnull -noconsole < $TCL_SCRIPT > /dev/null

# 8. Post-Process the PEX Netlist
if [ -f "$PEX_FILE" ]; then
    echo "Cleaning up SPICE dialect conflicts (**FLOATING tags)..."
    sed -i 's/\*\*.*//g' "$PEX_FILE"

    echo "Syncing internal layout nodes to match global LVS ports..."
    for PORT in $GOLDEN_PORTS; do
        # Check if the port ends with an exclamation mark
        if [[ "$PORT" == *! ]]; then
            BASE_PORT="${PORT%!}" # Strips the '!' (e.g., turns VDD! into VDD)
            
            # Safely replace the base port with the global port everywhere in the file.
            # The \b (word boundary) ensures we change 'VDD' to 'VDD!' 
            # and 'VDD.t0' to 'VDD!.t0', without accidentally ruining 'VDD_uq0'.
            sed -i "s/\b${BASE_PORT}\b/${PORT}/g" "$PEX_FILE"
        fi
    done

    echo "Injecting LVS ports into PEX netlist..."
    sed -i "s/\.subckt x${CELL_NAME}/.subckt x${CELL_NAME} ${GOLDEN_PORTS}/" "$PEX_FILE"
else
    echo "Error: Magic failed to generate the SPICE file."
    exit 1
fi

# 9. Clean up temporary files
rm -f $TCL_SCRIPT ${CELL_NAME}*.ext ${CELL_NAME}*.sim ${CELL_NAME}*.nodes ${CELL_NAME}*.res.ext

echo "========================================"
echo " Done! Final synced netlist is ready at:"
echo " $WORK_DIR/$PEX_FILE"
echo "========================================"
