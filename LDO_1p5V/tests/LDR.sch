v {xschem version=3.4.8RC file_version=1.2}
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
N 640 -320 770 -320 {lab=VOUT}
N 750 -150 810 -150 {lab=VSS}
N 150 -410 150 -340 {lab=VREF}
N 150 -410 340 -410 {lab=VREF}
N 150 -280 150 -220 {lab=VSS}
N 50 -220 150 -220 {lab=VSS}
N 60 -280 60 -220 {lab=VSS}
N 60 -410 60 -340 {lab=VIN}
N 590 -570 590 -470 {lab=VIN}
N 450 -490 450 -470 {lab=#net2}
N 450 -570 450 -550 {lab=GND}
N 700 -190 700 -150 {lab=VSS}
N 700 -150 750 -150 {lab=VSS}
N 700 -320 700 -250 {lab=VOUT}
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
C {code.sym} 150 -630 0 0 {name=loadReg only_toplevel=false value="
.options savecurrents
.save all

.control
set filetype=ascii

echo ===== LOAD REGULATION ANALYSIS =====

* Mantén VIN fijo en el valor típico
alter VIN 1.8

* Barrido de corriente de carga: 10uA a 1mA
dc ILOAD1 10u 1m 10u

echo ===== MEASUREMENTS =====

meas dc vout_min min v(VOUT)
meas dc vout_max max v(VOUT)

let delta_vout = vout_max - vout_min
let delta_iload = 1m - 10u

* Load regulation en V/A
let load_reg_v_a = delta_vout / delta_iload

* Load regulation en mV/mA
let load_reg_mv_ma = load_reg_v_a

* Variación total de salida en mV
let load_reg_total_mv = delta_vout * 1000

echo ===== LOAD REGULATION RESULTS =====
print vout_min
print vout_max
print delta_vout
print load_reg_mv_ma
print load_reg_total_mv

plot v(VOUT)

.endc
"}
C {sky130_fd_pr/corner.sym} 0 -630 0 0 {name=CORNER only_toplevel=true corner=tt}
C {gnd.sym} 450 -570 2 0 {name=l2 lab=GND}
C {isource.sym} 700 -220 0 0 {name=ILOAD1 value=1m}
