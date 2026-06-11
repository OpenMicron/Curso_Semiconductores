v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -30 -40 0 -40 {lab=A}
N -30 70 0 70 {lab=A}
N -30 -40 -30 70 {lab=A}
N 40 -10 40 40 {lab=Y}
N 40 -40 60 -40 {lab=VDD!}
N 60 -70 60 -40 {lab=VDD!}
N 60 -90 60 -70 {lab=VDD!}
N 40 -90 60 -90 {lab=VDD!}
N 40 -90 40 -70 {lab=VDD!}
N 40 70 60 70 {lab=xxx}
N 60 70 60 130 {lab=xxx}
N 40 130 60 130 {lab=xxx}
N 40 100 40 130 {lab=xxx}
N 40 -110 40 -90 {lab=VDD!}
N 40 130 40 150 {lab=xxx}
N -40 20 -30 20 {lab=A}
N 40 20 60 20 {lab=Y}
C {sky130_fd_pr/nfet_01v8.sym} 20 70 0 0 {name=M1
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
C {sky130_fd_pr/pfet_01v8.sym} 20 -40 0 0 {name=M2
W=0.84
L=0.15
nf=1
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {ipin.sym} -40 20 0 0 {name=p3 lab=A}
C {opin.sym} 60 20 0 0 {name=p4 lab=Y}
C {iopin.sym} 40 -110 0 0 {name=p1 lab=VDD!}
C {iopin.sym} 40 150 0 0 {name=p2 lab=VSS!}
