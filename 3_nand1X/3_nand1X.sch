v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 10 -20 10 -0 {lab=Y}
N 10 -0 240 -0 {lab=Y}
N 240 -20 240 -0 {lab=Y}
N 120 -20 120 -0 {lab=Y}
N 120 0 120 30 {lab=Y}
N 120 90 120 120 {lab=#net1}
N 120 180 120 210 {lab=#net2}
N 10 -100 10 -80 {lab=VDD!}
N 10 -100 240 -100 {lab=VDD!}
N 240 -100 240 -80 {lab=VDD!}
N 120 -100 120 -80 {lab=VDD!}
N 10 -50 20 -50 {lab=VDD!}
N 20 -100 20 -50 {lab=VDD!}
N 120 -50 130 -50 {lab=VDD!}
N 130 -100 130 -50 {lab=VDD!}
N 240 -50 250 -50 {lab=VDD!}
N 250 -100 250 -50 {lab=VDD!}
N 240 -100 250 -100 {lab=VDD!}
N 120 270 120 300 {lab=VDD!}
N 120 240 130 240 {lab=VDD!}
N 130 240 130 300 {lab=VDD!}
N 120 300 130 300 {lab=VDD!}
N 120 150 130 150 {lab=VDD!}
N 130 150 130 240 {lab=VDD!}
N 120 60 130 60 {lab=VDD!}
N 130 60 130 150 {lab=VDD!}
N -40 -50 -30 -50 {lab=A}
N 70 -50 80 -50 {lab=B}
N 190 -50 200 -50 {lab=C}
N 60 60 80 60 {lab=A}
N 50 150 80 150 {lab=B}
N 50 240 80 240 {lab=C}
N 240 -0 300 0 {lab=Y}
C {sky130_fd_pr/pfet_01v8.sym} -10 -50 0 0 {name=M1
W=0.63
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
C {sky130_fd_pr/nfet_01v8.sym} 100 60 0 0 {name=M2
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
C {sky130_fd_pr/nfet_01v8.sym} 100 150 0 0 {name=M5
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
C {sky130_fd_pr/nfet_01v8.sym} 100 240 0 0 {name=M6
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
C {ipin.sym} -40 -50 0 0 {name=p3 lab=A}
C {ipin.sym} 70 -50 0 0 {name=p4 lab=B}
C {ipin.sym} 190 -50 0 0 {name=p5 lab=C}
C {lab_pin.sym} -30 -50 3 0 {name=p6 sig_type=std_logic lab=A}
C {lab_pin.sym} 70 -50 3 0 {name=p7 sig_type=std_logic lab=B}
C {lab_pin.sym} 190 -50 3 0 {name=p8 sig_type=std_logic lab=C}
C {lab_pin.sym} 60 60 0 0 {name=p9 sig_type=std_logic lab=A}
C {lab_pin.sym} 50 150 0 0 {name=p10 sig_type=std_logic lab=B}
C {lab_pin.sym} 50 240 0 0 {name=p11 sig_type=std_logic lab=C}
C {opin.sym} 300 0 0 0 {name=p12 lab=Y}
C {sky130_fd_pr/pfet_01v8.sym} 100 -50 0 0 {name=M3
W=0.63
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
C {sky130_fd_pr/pfet_01v8.sym} 220 -50 0 0 {name=M4
W=0.63
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
C {iopin.sym} 250 -90 0 0 {name=p1 lab=VDD!}
C {iopin.sym} 130 290 0 0 {name=p2 lab=VSS!}
