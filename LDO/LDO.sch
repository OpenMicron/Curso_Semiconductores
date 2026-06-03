v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
L 4 610 -530 610 -300 {}
L 4 610 -300 675 -300 {}
L 4 675 -305 675 -300 {}
L 4 675 -305 700 -300 {}
L 4 675 -290 700 -300 {}
L 4 675 -300 675 -290 {}
P 4 5 55 -215 160 -215 160 -150 55 -150 55 -215 {dash=4}
T {shorted in upper
hierarchy} 55 -145 0 0 0.4 0.4 {}
T {max. 1mA} 675 -335 0 0 0.4 0.4 {}
N 590 -540 590 -410 {lab=VIN}
N 590 -380 660 -380 {lab=VIN}
N 660 -540 660 -380 {lab=VIN}
N 590 -350 590 -230 {lab=VOUT}
N 420 -380 550 -380 {lab=Vgate}
N 150 -350 230 -350 {lab=VFB1}
N 150 -350 150 -200 {lab=VFB1}
N 130 -200 150 -200 {lab=VFB1}
N 320 -540 320 -440 {lab=VIN}
N 320 -540 660 -540 {lab=VIN}
N 100 -410 230 -410 {lab=VREF}
N 590 -280 790 -280 {lab=VOUT}
N 590 -90 590 0 {lab=VSS}
N 100 -0 590 0 {lab=VSS}
N 100 -540 320 -540 {lab=VIN}
N 130 -165 555 -165 {lab=VFB2}
N 440 -300 465 -300 {lab=Vgate}
N 440 -380 440 -300 {lab=Vgate}
N 525 -300 590 -300 {lab=VOUT}
N 290 -505 290 -440 {lab=IBias}
N 100 -505 290 -505 {lab=IBias}
N 300 -310 300 -280 {lab=VSS}
N 270 -280 300 -280 {lab=VSS}
C {sky130_fd_pr/pfet_01v8.sym} 570 -380 0 0 {name=M7
W=6
L=0.15
nf=1
mult=50
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {iopin.sym} 100 -540 2 0 {name=p1 lab=VIN}
C {iopin.sym} 100 -410 2 0 {name=p2 lab=VREF}
C {iopin.sym} 130 -200 2 0 {name=p3 lab=VFB1}
C {iopin.sym} 100 0 2 0 {name=p4 lab=VSS}
C {iopin.sym} 130 -165 2 0 {name=p5 lab=VFB2}
C {sky130_fd_pr/cap_mim_m3_1.sym} 495 -300 3 0 {name=C3 model=cap_mim_m3_1 W=10 L=10 MF=10 spiceprefix=X}
C {iopin.sym} 790 -280 0 0 {name=p6 lab=VOUT}
C {iopin.sym} 100 -505 2 0 {name=p7 lab=IBias}
C {lab_wire.sym} 270 -280 0 0 {name=p8 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 475 -380 0 0 {name=p9 sig_type=std_logic lab=Vgate}
C {/foss/designs/Curso_Semiconductores/OTA_5T/OTA_5T.sym} 300 -380 0 0 {name=x1}
C {/foss/designs/Curso_Semiconductores/RES_FB/RES_FB.sym} 590 -90 0 0 {name=x2}
