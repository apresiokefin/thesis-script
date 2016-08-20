#! /usr/bin/gnuplot
reset

Fe=-758.5254848095
N=-270.1007281425
C=-155.0873161391

FeNC=-12074.4557572134
FeNCN=-12188.9512334494

f1(x)=FeNC-((66*C)+(1*Fe)+(4*(N+x)))
f2(x)=FeNCN-((65*C)+(1*Fe)+(5*(N+x)))

set terminal postscript eps enhanced font "Roman"
set output '~/FeNC/FormE'

set xrange [0:0.54]
set yrange [-2.5:2.5]
set xlabel "{/Symbol D}{/Symbol m}_N (eV)"
set ylabel "{/Symbol D}E_{formation} (eV)"
set key left bottom Left box height 1
#set key left bottom Left box width 4 height 1

set xtics add ("0.0\nN_2" "0.0")
set xtics add ("0.54\ng-C_3N_4" "0.54")

#set label "0,0 screen" at screen 0
#gnuplot> set label "(0,0) first"  at first  0, first  0
#gnuplot> set label "(0,0) graph"  at graph  0, graph  0

plot f1(x) title "FeN_4-Graphene", f2(x) title "N-doped FeN_4-Graphene",0 dt "_ " lc rgb "black" notitle

set terminal pngcairo dashed font "Roman,10"
set output '~/FeNC/FormE.png'
replot
