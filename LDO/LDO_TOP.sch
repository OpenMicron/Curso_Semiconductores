v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
N 110 -260 160 -260 {lab=#net1}
N 110 -260 110 -140 {lab=#net1}
N 110 -140 160 -140 {lab=#net1}
N 80 -320 160 -320 {lab=#net2}
N 460 -230 530 -230 {lab=#net3}
N 410 -40 410 0 {lab=#net4}
N 370 0 410 0 {lab=#net4}
N 270 -420 270 -380 {lab=IBias}
N 410 -420 410 -380 {lab=VIN}
C {/foss/designs/IPN/LDO_1p5V/schematics/LDO.sym} 160 -40 0 0 {name=x1}
C {iopin.sym} 410 -420 2 0 {name=p1 lab=VIN}
C {iopin.sym} 80 -320 2 0 {name=p2 lab=VREF}
C {iopin.sym} 270 -420 2 0 {name=p7 lab=IBias}
C {iopin.sym} 530 -230 0 0 {name=p6 lab=VOUT}
C {iopin.sym} 370 0 2 0 {name=p4 lab=VSS}
