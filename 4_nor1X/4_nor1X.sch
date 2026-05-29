v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
P 4 1 230 200 {}
N 0 -160 0 -150 {lab=#net1}
N 0 -150 0 -140 {lab=#net1}
N 0 -80 0 -60 {lab=#net2}
N -120 120 -120 130 {lab=Y}
N -120 120 90 120 {lab=Y}
N 90 120 90 130 {lab=Y}
N -20 120 -20 130 {lab=Y}
N -120 190 -120 200 {lab=VSS!}
N -120 200 90 200 {lab=VSS!}
N 90 190 90 200 {lab=VSS!}
N -20 190 -20 200 {lab=VSS!}
N 0 -270 0 -220 {lab=VDD!}
N 0 -190 10 -190 {lab=VDD!}
N 10 -230 10 -190 {lab=VDD!}
N 0 -230 10 -230 {lab=VDD!}
N 0 -110 10 -110 {lab=VDD!}
N 10 -190 10 -110 {lab=VDD!}
N 0 -30 10 -30 {lab=VDD!}
N 10 -110 10 -30 {lab=VDD!}
N -120 160 -100 160 {lab=VSS!}
N -100 160 -100 200 {lab=VSS!}
N -20 160 0 160 {lab=VSS!}
N 0 160 0 200 {lab=VSS!}
N 90 160 110 160 {lab=VSS!}
N 110 160 110 200 {lab=VSS!}
N 90 200 110 200 {lab=VSS!}
N -60 -190 -40 -190 {lab=A}
N -60 -110 -40 -110 {lab=B}
N -60 -30 -40 -30 {lab=C}
N -170 160 -160 160 {lab=A}
N -70 160 -60 160 {lab=B}
N 40 160 50 160 {lab=C}
N 200 120 200 130 {lab=Y}
N 90 120 200 120 {lab=Y}
N 200 190 200 200 {lab=VSS!}
N 110 200 200 200 {lab=VSS!}
N 200 160 210 160 {lab=VSS!}
N 210 160 210 200 {lab=VSS!}
N 200 200 210 200 {lab=VSS!}
N -0 0 -0 20 {lab=#net3}
N -0 50 10 50 {lab=VDD!}
N 10 -30 10 50 {lab=VDD!}
N -60 50 -40 50 {lab=D}
N 150 160 160 160 {lab=D}
N -0 80 -0 120 {lab=Y}
N 200 120 250 120 {lab=Y}
C {sky130_fd_pr/pfet_01v8.sym} -20 -190 0 0 {name=M2
W=0.84
L=0.15
nf=1
mult=2
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} -140 160 0 0 {name=M1
W=0.42
L=0.15
nf=1 
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} -40 160 0 0 {name=M5
W=0.42
L=0.15
nf=1 
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} 70 160 0 0 {name=M6
W=0.42
L=0.15
nf=1 
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {ipin.sym} -60 -190 0 0 {name=p1 lab=A}
C {ipin.sym} -60 -110 0 0 {name=p2 lab=B}
C {ipin.sym} -60 -30 0 0 {name=p3 lab=C}
C {lab_wire.sym} -50 -190 0 0 {name=p4 sig_type=std_logic lab=A}
C {lab_wire.sym} -50 -110 0 0 {name=p5 sig_type=std_logic lab=B}
C {lab_wire.sym} -50 -30 0 0 {name=p6 sig_type=std_logic lab=C}
C {lab_wire.sym} -170 160 0 0 {name=p7 sig_type=std_logic lab=A}
C {lab_wire.sym} -70 160 0 0 {name=p8 sig_type=std_logic lab=B}
C {lab_wire.sym} 40 160 0 0 {name=p9 sig_type=std_logic lab=C}
C {opin.sym} 250 120 0 0 {name=p11 lab=Y}
C {lab_wire.sym} -50 200 0 0 {name=p10 sig_type=std_logic lab=VSS!}
C {lab_wire.sym} 0 -270 0 0 {name=p12 sig_type=std_logic lab=VDD!}
C {sky130_fd_pr/nfet_01v8.sym} 180 160 0 0 {name=M7
W=0.42
L=0.15
nf=1 
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {ipin.sym} -60 50 0 0 {name=p13 lab=D}
C {lab_wire.sym} -50 50 0 0 {name=p14 sig_type=std_logic lab=D}
C {lab_wire.sym} 150 160 0 0 {name=p15 sig_type=std_logic lab=D}
C {sky130_fd_pr/pfet_01v8.sym} -20 -110 0 0 {name=M3
W=0.84
L=0.15
nf=1
mult=2
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} -20 -30 0 0 {name=M4
W=0.84
L=0.15
nf=1
mult=2
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} -20 50 0 0 {name=M8
W=0.84
L=0.15
nf=1
mult=2
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
