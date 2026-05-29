v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
B 2 -580 -430 220 -30 {flags=graph
y1=0
y2=1.8
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=1.8
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
color="17 5"
node="y
a"}
N -1130 -230 -1130 -200 {lab=VDD!}
N -970 -190 -850 -190 {lab=A}
N -730 -190 -670 -190 {lab=Y}
N -1210 -230 -1210 -200 {lab=VSS!}
N -1210 -140 -1210 -120 {lab=0}
N -1130 -140 -1130 -120 {lab=0}
N -970 -130 -970 -90 {lab=0}
N -770 -190 -730 -190 {lab=Y}
C {vsource.sym} -1130 -170 0 0 {name=V1 value=1.8 savecurrent=false}
C {gnd.sym} -1130 -120 0 0 {name=l1 lab=0}
C {lab_wire.sym} -1130 -230 0 0 {name=p1 sig_type=std_logic lab=VDD!
}
C {lab_wire.sym} -1210 -230 0 0 {name=p2 sig_type=std_logic lab=VSS!
}
C {vsource.sym} -970 -160 0 0 {name=Vin value=0 savecurrent=false}
C {lab_wire.sym} -670 -190 0 0 {name=p3 sig_type=std_logic lab=Y}
C {lab_wire.sym} -890 -190 0 0 {name=p4 sig_type=std_logic lab=A}
C {vsource.sym} -1210 -170 0 0 {name=V2 value=0 savecurrent=false}
C {gnd.sym} -1210 -120 0 0 {name=l2 lab=0}
C {sky130_fd_pr/corner.sym} -1240 -390 0 0 {name=CORNER only_toplevel=true corner=tt}
C {code_shown.sym} -1060 -360 0 0 {name=s1 only_toplevel=false value=
"
.global VDD! VSS!
.control
dc Vin 0 1.8 0.01
save all
write inv1X_tb.raw all
.endc
"}
C {gnd.sym} -970 -90 0 0 {name=l3 lab=0}
C {devices/launcher.sym} -760 -380 0 0 {name=h17 
descr="Load waves" 
tclcommand="
xschem raw_read $netlist_dir/[file tail [file rootname [xschem get current_name]]].raw tran
"
}
C {/foss/designs/micron/micron_stdcells/inv1X/inv1X.sym} -850 -190 0 0 {name=x1}
