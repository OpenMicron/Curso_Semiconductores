v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
N 590 -130 590 -110 {lab=VSS}
N 590 -50 590 -30 {lab=GND}
N 280 -350 340 -350 {lab=VFB_OTA}
N 280 -230 340 -230 {lab=VFB_DIV}
N 750 -150 810 -150 {lab=VSS}
N 150 -410 150 -340 {lab=VREF}
N 150 -410 340 -410 {lab=VREF}
N 150 -280 150 -220 {lab=VSS}
N 50 -220 150 -220 {lab=VSS}
N 60 -280 60 -220 {lab=VSS}
N 60 -410 60 -340 {lab=VIN}
N 590 -570 590 -470 {lab=VIN}
N 450 -490 450 -470 {lab=#net1}
N 450 -570 450 -550 {lab=GND}
N 690 -320 690 -250 {lab=VOUT}
N 690 -190 690 -150 {lab=VSS}
N 690 -150 750 -150 {lab=VSS}
N 210 -290 210 -280 {lab=#net2}
N 210 -290 280 -290 {lab=#net2}
N 150 -220 210 -220 {lab=VSS}
N 280 -370 280 -350 {lab=VFB_OTA}
N 640 -320 770 -320 {lab=VOUT}
C {/foss/designs/IPN/LDO_1p5V/schematics/LDO.sym} 340 -130 0 0 {name=x1}
C {gnd.sym} 590 -30 0 0 {name=l1 lab=GND}
C {vsource.sym} 590 -80 0 0 {name=VSS value=0 savecurrent=false}
C {lab_pin.sym} 770 -320 2 0 {name=p1 sig_type=std_logic lab=VOUT}
C {lab_pin.sym} 810 -150 2 0 {name=p2 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 590 -120 2 0 {name=p3 sig_type=std_logic lab=VSS}
C {vsource.sym} 150 -310 0 0 {name=VREF value=1.2 savecurrent=false}
C {lab_pin.sym} 50 -220 0 0 {name=p4 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 150 -410 0 0 {name=p5 sig_type=std_logic lab=VREF}
C {vsource.sym} 60 -310 0 0 {name=VIN value=1.8 savecurrent=false}
C {lab_pin.sym} 60 -410 0 0 {name=p6 sig_type=std_logic lab=VIN}
C {lab_pin.sym} 590 -570 0 0 {name=p7 sig_type=std_logic lab=VIN}
C {isource.sym} 450 -520 0 0 {name=I0 value=12u}
C {code.sym} 140 -630 0 0 {name=stb_fb only_toplevel=false value="
.options savecurrents
.save all

.control
set filetype=ascii

echo ==============================================
echo ===== LDO STABILITY / LOOP GAIN ANALYSIS =====
echo ==============================================

****************************************************
* CASE 1: ILOAD = 10uA
****************************************************

echo ===== CASE 1: ILOAD = 10uA =====

alter I1 10u

op

echo ===== OPERATING POINT - ILOAD = 10uA =====
print v(VIN)
print v(VOUT)
print v(VREF)
print v(VFB_OTA)
print v(VFB_DIV)
print v(VSS)

echo ===== AC ANALYSIS - ILOAD = 10uA =====
ac dec 200 1 10g

echo ===== LOOP GAIN - ILOAD = 10uA =====

* Fuente de prueba V4: dc 0 ac 1
* La fuente está entre VFB_OTA y VFB_DIV
* La señal de retorno se mide en VFB_DIV

let loopgain_10u = -v(VFB_DIV)
let loopgain_10u_db = db(loopgain_10u)
let loopgain_10u_phase_deg = ph(loopgain_10u)*180/3.141592653589793

meas ac loop_gain_dc_10u find loopgain_10u_db at=1
meas ac unity_freq_10u when loopgain_10u_db=0
meas ac phase_at_unity_10u find loopgain_10u_phase_deg when loopgain_10u_db=0

let phase_margin_10u = 180 + phase_at_unity_10u

echo ===== RESULTS - ILOAD = 10uA =====
print loop_gain_dc_10u
print unity_freq_10u
print phase_at_unity_10u
print phase_margin_10u


****************************************************
* CASE 2: ILOAD = 1mA
****************************************************

echo ===== CASE 2: ILOAD = 1mA =====

alter I1 1m

op

echo ===== OPERATING POINT - ILOAD = 1mA =====
print v(VIN)
print v(VOUT)
print v(VREF)
print v(VFB_OTA)
print v(VFB_DIV)
print v(VSS)

echo ===== AC ANALYSIS - ILOAD = 1mA =====
ac dec 200 1 10g

echo ===== LOOP GAIN - ILOAD = 1mA =====

let loopgain_1m = -v(VFB_DIV)
let loopgain_1m_db = db(loopgain_1m)
let loopgain_1m_phase_deg = ph(loopgain_1m)*180/3.141592653589793

meas ac loop_gain_dc_1m find loopgain_1m_db at=1
meas ac unity_freq_1m when loopgain_1m_db=0
meas ac phase_at_unity_1m find loopgain_1m_phase_deg when loopgain_1m_db=0

let phase_margin_1m = 180 + phase_at_unity_1m

echo ===== RESULTS - ILOAD = 1mA =====
print loop_gain_dc_1m
print unity_freq_1m
print phase_at_unity_1m
print phase_margin_1m


****************************************************
* PLOTS - BOTH LOAD CONDITIONS
****************************************************

echo ===== PLOT LOOP GAIN BOTH LOAD CONDITIONS =====

plot ac1.loopgain_10u_db ac2.loopgain_1m_db xlog

echo ===== PLOT LOOP PHASE BOTH LOAD CONDITIONS =====

plot ac1.loopgain_10u_phase_deg ac2.loopgain_1m_phase_deg xlog


****************************************************
* EXPORT DATA
****************************************************

*wrdata loopgain_10u.csv ac1.frequency ac1.loopgain_10u_db ac1.loopgain_10u_phase_deg
*wrdata loopgain_1m.csv ac2.frequency ac2.loopgain_1m_db ac2.loopgain_1m_phase_deg

.endc
"}
C {sky130_fd_pr/corner.sym} 0 -630 0 0 {name=CORNER only_toplevel=true corner=tt}
C {isource.sym} 690 -220 0 0 {name=I1 value=10u}
C {vsource.sym} 280 -320 0 0 {name=V4 value="dc 0 ac 1" savecurrent=false}
C {res.sym} 280 -260 2 0 {name=R11
value=100G
footprint=1206
device=resistor
m=1}
C {capa.sym} 210 -250 0 0 {name=C2
m=1
value=100u
footprint=1206
device="ceramic capacitor"}
C {lab_pin.sym} 280 -370 0 0 {name=p9 sig_type=std_logic lab=VFB_OTA}
C {lab_pin.sym} 300 -230 3 0 {name=p10 sig_type=std_logic lab=VFB_DIV}
C {gnd.sym} 450 -570 2 0 {name=l2 lab=GND}
