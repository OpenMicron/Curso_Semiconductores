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
N 690 -150 750 -150 {lab=VSS}
N 640 -320 770 -320 {lab=VOUT}
N 690 -170 690 -150 {lab=VSS}
N 690 -320 690 -290 {lab=VOUT}
C {gnd.sym} 590 -30 0 0 {name=l1 lab=GND}
C {vsource.sym} 590 -80 0 0 {name=VSS value=0 savecurrent=false}
C {lab_pin.sym} 590 -120 2 0 {name=p3 sig_type=std_logic lab=VSS}
C {vsource.sym} 150 -310 0 0 {name=VREF value=1.2 savecurrent=false}
C {lab_pin.sym} 50 -220 0 0 {name=p4 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 150 -410 0 0 {name=p5 sig_type=std_logic lab=VREF}
C {vsource.sym} 60 -310 0 0 {name=VIN value="dc 1.8 ac 0" savecurrent=false}
C {lab_pin.sym} 60 -410 0 0 {name=p6 sig_type=std_logic lab=VIN}
C {lab_pin.sym} 590 -570 0 0 {name=p7 sig_type=std_logic lab=VIN}
C {isource.sym} 450 -520 0 0 {name=I0 value=12u}
C {code.sym} 150 -630 0 0 {name=LOAD_TRAN only_toplevel=false value="
.options savecurrents
.save all
.save v(x1.vgate)

.control
set filetype=ascii

echo ==========================================
echo ===== LDO LOAD TRANSIENT ANALYSIS =====
echo ==========================================

op

echo ===== OPERATING POINT =====
print v(VIN)
print v(VOUT)
print v(VREF)
print v(x1.vgate)

echo ===== TRANSIENT ANALYSIS =====

* Fuente de carga en el esquemático:
* ILOAD1 PULSE(10u 1m 5u 1u 1u 20u 40u)

tran 10n 100u

echo ==========================================
echo ===== TRANSIENT MEASUREMENTS =====
echo ==========================================

* VOUT nominal = 1.5 V
* Settling band = +/-1%
* Lower band = 1.485 V
* Upper band = 1.515 V

****************************************************
* GLOBAL MIN/MAX
****************************************************

meas tran vout_min_all min v(VOUT)
meas tran vout_max_all max v(VOUT)

let global_undershoot_mv = (1.5 - vout_min_all)*1000
let global_overshoot_mv  = (vout_max_all - 1.5)*1000

****************************************************
* STEP 1: LOAD RISE 10uA -> 1mA
* Starts at 5us, ends at 6us
****************************************************

meas tran vout_min_step1 min v(VOUT) from=5u to=26u

let undershoot_step1_mv = (1.5 - vout_min_step1)*1000

* Settling after load rise:
* Time when VOUT comes back above 1.485 V
meas tran t_settle_step1_abs when v(VOUT)=1.485 rise=1 from=5u to=26u

let t_settle_step1 = t_settle_step1_abs - 5u
let t_settle_step1_us = t_settle_step1*1e6

****************************************************
* STEP 2: LOAD FALL 1mA -> 10uA
* Starts at 26us, ends at 27us
****************************************************

meas tran vout_max_step2 max v(VOUT) from=26u to=45u

let overshoot_step2_mv = (vout_max_step2 - 1.5)*1000

* Settling after load fall:
* Time when VOUT comes back below 1.515 V
meas tran t_settle_step2_abs when v(VOUT)=1.515 fall=1 from=26u to=45u

let t_settle_step2 = t_settle_step2_abs - 26u
let t_settle_step2_us = t_settle_step2*1e6

****************************************************
* STEP 3: SECOND LOAD RISE 10uA -> 1mA
* Starts at 45us, ends at 46us
****************************************************

meas tran vout_min_step3 min v(VOUT) from=45u to=66u

let undershoot_step3_mv = (1.5 - vout_min_step3)*1000

meas tran t_settle_step3_abs when v(VOUT)=1.485 rise=1 from=45u to=66u

let t_settle_step3 = t_settle_step3_abs - 45u
let t_settle_step3_us = t_settle_step3*1e6

****************************************************
* STEP 4: SECOND LOAD FALL 1mA -> 10uA
* Starts at 66us, ends at 67us
****************************************************

meas tran vout_max_step4 max v(VOUT) from=66u to=85u

let overshoot_step4_mv = (vout_max_step4 - 1.5)*1000

meas tran t_settle_step4_abs when v(VOUT)=1.515 fall=1 from=66u to=85u

let t_settle_step4 = t_settle_step4_abs - 66u
let t_settle_step4_us = t_settle_step4*1e6

****************************************************
* RESULTS
****************************************************

echo ===== GLOBAL RESULTS =====
print vout_min_all
print vout_max_all
print global_undershoot_mv
print global_overshoot_mv

echo ===== STEP 1: 10uA -> 1mA =====
print vout_min_step1
print undershoot_step1_mv
print t_settle_step1_us

echo ===== STEP 2: 1mA -> 10uA =====
print vout_max_step2
print overshoot_step2_mv
print t_settle_step2_us

echo ===== STEP 3: 10uA -> 1mA =====
print vout_min_step3
print undershoot_step3_mv
print t_settle_step3_us

echo ===== STEP 4: 1mA -> 10uA =====
print vout_max_step4
print overshoot_step4_mv
print t_settle_step4_us

****************************************************
* PLOTS
****************************************************

echo ===== PLOTS =====

plot v(VOUT)
*plot v(x1.vgate)
plot @iload1[current]
plot v(VOUT) v(x1.vgate)
*plot v(VOUT) @iload1[current]

.endc
"}
C {sky130_fd_pr/corner.sym} 0 -630 0 0 {name=CORNER only_toplevel=true corner=tt}
C {gnd.sym} 450 -570 2 0 {name=l2 lab=GND}
C {lab_pin.sym} 770 -320 2 0 {name=p1 sig_type=std_logic lab=VOUT}
C {lab_pin.sym} 810 -150 2 0 {name=p2 sig_type=std_logic lab=VSS}
C {isource.sym} 690 -260 0 0 {name=ILOAD1 value="PULSE(10u 1m 5u 1u 1u 20u 40u)"}
C {ammeter.sym} 690 -200 0 0 {name=Vmeas1 savecurrent=true spice_ignore=0}
C {/foss/designs/Curso_Semiconductores/LDO_1p5V/schematics/LDO_TOP.sym} 340 -130 0 0 {name=x1}
