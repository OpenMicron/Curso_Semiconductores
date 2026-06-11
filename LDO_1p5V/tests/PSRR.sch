v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 590 -130 590 -110 {lab=VSS}
N 590 -50 590 -30 {lab=GND}
N 280 -350 340 -350 {lab=#net1}
N 280 -350 280 -230 {lab=#net1}
N 280 -230 340 -230 {lab=#net1}
N 150 -410 150 -340 {lab=VREF}
N 150 -410 340 -410 {lab=VREF}
N 150 -280 150 -220 {lab=VSS}
N 50 -220 150 -220 {lab=VSS}
N 60 -280 60 -220 {lab=VSS}
N 60 -410 60 -340 {lab=VIN}
N 590 -570 590 -470 {lab=VIN}
N 450 -490 450 -470 {lab=#net2}
N 450 -570 450 -550 {lab=GND}
N 750 -150 810 -150 {lab=VSS}
N 690 -320 690 -250 {lab=VOUT}
N 690 -190 690 -150 {lab=VSS}
N 690 -150 750 -150 {lab=VSS}
N 640 -320 770 -320 {lab=VOUT}
C {gnd.sym} 590 -30 0 0 {name=l1 lab=GND}
C {vsource.sym} 590 -80 0 0 {name=VSS value=0 savecurrent=false}
C {lab_pin.sym} 590 -120 2 0 {name=p3 sig_type=std_logic lab=VSS}
C {vsource.sym} 150 -310 0 0 {name=VREF value=1.2 savecurrent=false}
C {lab_pin.sym} 50 -220 0 0 {name=p4 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 150 -410 0 0 {name=p5 sig_type=std_logic lab=VREF}
C {vsource.sym} 60 -310 0 0 {name=VIN value="dc 1.8 ac 1" savecurrent=false}
C {lab_pin.sym} 60 -410 0 0 {name=p6 sig_type=std_logic lab=VIN}
C {lab_pin.sym} 590 -570 0 0 {name=p7 sig_type=std_logic lab=VIN}
C {isource.sym} 450 -520 0 0 {name=I0 value=12u}
C {code.sym} 150 -630 0 0 {name=PSR only_toplevel=false value="
.options savecurrents
.save all
.save v(x1.vgate)

.control
set filetype=ascii

echo ===== PSRR ANALYSIS - TWO LOAD CONDITIONS =====

****************************************************
* CASE 1: ILOAD = 10uA
****************************************************

echo ===== CASE 1: ILOAD = 10uA =====

alter I1 10u

op
ac dec 200 1 100G

let vin_ac = v(VIN)
let vout_ac = v(VOUT)
let vgate_ac = v(x1.vgate)

let psrr_gain = mag(vout_ac/vin_ac)
let psrr_10u_db = 20*log10(psrr_gain)

let vin_to_vgate_10u_db = 20*log10(mag(vgate_ac/vin_ac))

meas ac psrr_10u_10Hz   find psrr_10u_db at=10
meas ac psrr_10u_100khz find psrr_10u_db at=100k
meas ac psrr_10u_1mhz   find psrr_10u_db at=1Meg
meas ac psrr_10u_10mhz  find psrr_10u_db at=10Meg
meas ac psrr_10u_max    max psrr_10u_db

echo ===== PSRR RESULTS - ILOAD = 10uA =====
print psrr_10u_10Hz
print psrr_10u_100khz
print psrr_10u_1mhz
print psrr_10u_10mhz
print psrr_10u_max


****************************************************
* CASE 2: ILOAD = 1mA
****************************************************

echo ===== CASE 2: ILOAD = 1mA =====

alter I1 1m

op
ac dec 200 1 10G

let vin_ac = v(VIN)
let vout_ac = v(VOUT)
let vgate_ac = v(x1.vgate)

let psrr_gain = mag(vout_ac/vin_ac)
let psrr_1m_db = 20*log10(psrr_gain)

let vin_to_vgate_1m_db = 20*log10(mag(vgate_ac/vin_ac))

meas ac psrr_1m_10hz   find psrr_1m_db at=10
meas ac psrr_1m_100khz find psrr_1m_db at=100k
meas ac psrr_1m_1mhz   find psrr_1m_db at=1Meg
meas ac psrr_1m_10mhz  find psrr_1m_db at=10Meg
meas ac psrr_1m_max    max psrr_1m_db

echo ===== PSRR RESULTS - ILOAD = 1mA =====

print psrr_1m_10hz
print psrr_1m_100khz
print psrr_1m_1mhz
print psrr_1m_10mhz
print psrr_1m_max


****************************************************
* PLOT BOTH LOAD CONDITIONS IN ONE GRAPH
****************************************************

echo ===== PLOTTING BOTH LOAD CONDITIONS =====

plot ac1.psrr_10u_db ac2.psrr_1m_db

plot ac1.vin_to_vgate_10u_db ac2.vin_to_vgate_1m_db

*plot ac1.psrr_10u_db ac2.psrr_1m_db ac1.vin_to_vgate_10u_db ac2.vin_to_vgate_1m_db

.endc
"}
C {sky130_fd_pr/corner.sym} 0 -630 0 0 {name=CORNER only_toplevel=true corner=tt}
C {gnd.sym} 450 -570 2 0 {name=l2 lab=GND}
C {lab_pin.sym} 770 -320 2 0 {name=p1 sig_type=std_logic lab=VOUT}
C {lab_pin.sym} 810 -150 2 0 {name=p2 sig_type=std_logic lab=VSS}
C {isource.sym} 690 -220 0 0 {name=I1 value=1m}
C {/foss/designs/Curso_Semiconductores/LDO_1p5V/schematics/LDO_TOP.sym} 340 -130 0 0 {name=x1}
