v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
T {6uA} 500 10 0 0 0.4 0.4 {}
T {1.2V} 340 -630 0 0 0.4 0.4 {}
T {1.5V} 840 -730 0 0 0.4 0.4 {}
N 650 -740 890 -740 {lab=VOUT}
N 530 -670 530 -660 {lab=#net1}
N 530 -740 530 -730 {lab=VOUT}
N 530 -390 530 -380 {lab=#net2}
N 530 -250 530 -240 {lab=#net3}
N 530 -470 530 -450 {lab=#net4}
N 530 -320 530 -310 {lab=#net5}
N 530 -740 650 -740 {lab=VOUT}
N 550 -700 580 -700 {lab=xxx}
N 580 -570 580 -150 {lab=xxx}
N 550 -210 580 -210 {lab=xxx}
N 550 -280 580 -280 {lab=xxx}
N 550 -350 580 -350 {lab=xxx}
N 550 -420 580 -420 {lab=xxx}
N 550 -630 580 -630 {lab=xxx}
N 580 -700 580 -570 {lab=xxx}
N 530 -110 530 -100 {lab=#net6}
N 530 -180 530 -170 {lab=#net7}
N 150 0 530 0 {lab=xxx}
N 530 0 580 0 {lab=xxx}
N 530 -600 530 -590 {lab=VFB}
N 550 -560 580 -560 {lab=xxx}
N 530 -530 530 -520 {lab=#net8}
N 550 -490 580 -490 {lab=xxx}
N 550 -140 580 -140 {lab=xxx}
N 580 -150 580 -140 {lab=xxx}
N 580 -140 580 0 {lab=xxx}
N 550 -70 580 -70 {lab=xxx}
N 530 -40 530 0 {lab=xxx}
N 340 -600 530 -600 {lab=VFB}
C {iopin.sym} 890 -740 0 0 {name=p3 lab=VOUT}
C {sky130_fd_pr/res_xhigh_po.sym} 530 -700 0 1 {name=R9
W=1
L=12.5
model=res_xhigh_po
spiceprefix=X
 mult=1}
C {sky130_fd_pr/res_xhigh_po.sym} 530 -630 0 1 {name=R1
W=1
L=12.5
model=res_xhigh_po
spiceprefix=X
 mult=1}
C {sky130_fd_pr/res_xhigh_po.sym} 530 -420 0 1 {name=R2
W=1
L=12.5
model=res_xhigh_po
spiceprefix=X
 mult=1}
C {sky130_fd_pr/res_xhigh_po.sym} 530 -350 0 1 {name=R3
W=1
L=12.5
model=res_xhigh_po
spiceprefix=X
 mult=1}
C {sky130_fd_pr/res_xhigh_po.sym} 530 -280 0 1 {name=R4
W=1
L=12.5
model=res_xhigh_po
spiceprefix=X
 mult=1}
C {sky130_fd_pr/res_xhigh_po.sym} 530 -210 0 1 {name=R5
W=1
L=12.5
model=res_xhigh_po
spiceprefix=X
 mult=1}
C {sky130_fd_pr/res_xhigh_po.sym} 530 -140 0 1 {name=R6
W=1
L=12.5
model=res_xhigh_po
spiceprefix=X
 mult=1}
C {sky130_fd_pr/res_xhigh_po.sym} 530 -70 0 1 {name=R7
W=1
L=12.5
model=res_xhigh_po
spiceprefix=X
 mult=1}
C {sky130_fd_pr/res_xhigh_po.sym} 530 -560 0 1 {name=R8
W=1
L=12.5
model=res_xhigh_po
spiceprefix=X
 mult=1}
C {sky130_fd_pr/res_xhigh_po.sym} 530 -490 0 1 {name=R10
W=1
L=12.5
model=res_xhigh_po
spiceprefix=X
 mult=1}
C {iopin.sym} 340 -600 2 0 {name=p1 lab=VFB}
C {iopin.sym} 150 0 2 0 {name=p2 lab=VSS}
