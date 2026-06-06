v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
B 2 680 -390 1480 10 {flags=graph
y1=-0.052
y2=2
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=1e-07
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
legendmag=1.0
dataset=-1
unitx=1
logx=0
logy=0
hilight_wave=0
digital=0
color=17
node=y}
B 2 680 -790 1480 -390 {flags=graph
y1=0
y2=1.8
ypos1=0
ypos2=1.8
divy=5
subdivy=1
unity=1
x1=0
x2=1e-07
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
legendmag=1.0
node=b
color=17
dataset=-1
unitx=1
logx=0
logy=0
digital=0
hilight_wave=-1}
B 2 680 -1190 1480 -790 {flags=graph
y1=0
y2=1.8
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=1e-07
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
legendmag=1.0
node=a
color=5
dataset=-1
unitx=1
logx=0
logy=0
}
B 2 1480 -790 2280 -390 {flags=graph
y1=0
y2=1.8
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=1e-07
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
legendmag=1.0
node=c
color=5
dataset=-1
unitx=1
logx=0
logy=0
}
N 130 -190 130 -160 {lab=VDD!}
N 290 -150 410 -150 {lab=A}
N 360 -130 410 -130 {lab=B}
N 600 -130 660 -130 {lab=Y}
N 50 -190 50 -160 {lab=VSS!}
N 50 -100 50 -80 {lab=0}
N 130 -100 130 -80 {lab=0}
N 360 -70 360 -50 {lab=0}
N 290 -90 290 -50 {lab=0}
N 290 -50 360 -50 {lab=0}
N 330 -50 330 -30 {lab=0}
N 360 -50 420 -50 {lab=0}
N 410 -130 470 -130 {lab=B}
N 410 -150 470 -150 {lab=A}
N 420 -110 470 -110 {lab=C}
C {vsource.sym} 130 -130 0 0 {name=V1 value=1.8 savecurrent=false}
C {gnd.sym} 130 -80 0 0 {name=l1 lab=0}
C {lab_wire.sym} 130 -190 0 0 {name=p1 sig_type=std_logic lab=VDD!
}
C {lab_wire.sym} 50 -190 0 0 {name=p2 sig_type=std_logic lab=VSS!
}
C {vsource.sym} 290 -120 0 0 {name=Va value="pulse(0 1.8 0 0.1n 0.1n 50n 100n)" savecurrent=false}
C {vsource.sym} 360 -100 0 0 {name=Vb value="pulse(0 1.8 0 0.1n 0.1n 25n 50n)" savecurrent=false}
C {lab_wire.sym} 660 -130 0 0 {name=p3 sig_type=std_logic lab=Y}
C {lab_wire.sym} 370 -150 0 0 {name=p4 sig_type=std_logic lab=A}
C {lab_wire.sym} 400 -130 0 0 {name=p5 sig_type=std_logic lab=B}
C {vsource.sym} 50 -130 0 0 {name=V2 value=0 savecurrent=false}
C {gnd.sym} 50 -80 0 0 {name=l2 lab=0}
C {sky130_fd_pr/corner.sym} 20 -350 0 0 {name=CORNER only_toplevel=true corner=tt}
C {code_shown.sym} 200 -320 0 0 {name=s1 only_toplevel=false value=
"
.global VDD! VSS!
.control
tran 0.1n 100n
save all
write 3_nand1X_tb.raw all
.endc
"}
C {gnd.sym} 330 -30 0 0 {name=l3 lab=0}
C {devices/launcher.sym} 500 -340 0 0 {name=h17 
descr="Load waves" 
tclcommand="
xschem raw_read $netlist_dir/[file tail [file rootname [xschem get current_name]]].raw tran
"
}
C {vsource.sym} 420 -80 0 0 {name=Vb1 value="pulse(0 1.8 0 0.1n 0.1n 12.5n 25n)" savecurrent=false}
C {lab_wire.sym} 450 -110 0 0 {name=p6 sig_type=std_logic lab=C}
C {/foss/designs/Curso_Semiconductores/3_nand1X/3_nand1X.sym} 470 -110 0 0 {name=x1}
