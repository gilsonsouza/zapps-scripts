reset
set terminal pngcairo crop size 5000,5000
set size ratio 0.5625

set output "logploted.png"    #Change here

set datafile separator " "
#set border 2+10


set tics front
set ytics border nomirror in scale 5 offset -10,0 font ",50"
set ytics format ""
set ylabel "Pages"  font ",50" offset -8,0
#set ytics format "%.1s%c"

set xtics border nomirror in scale 5 offset 0,-1 font ",60"
set xtics format "%.1s%c"
set xlabel "Request (identifier)" offset 0,-8 font ",50"


#set multiplot layout 2,1 rowsfirst title "CH-benCHmark (read_commited) for 10 minutes" font ",36"    #Change here
set tmargin 15
set bmargin 15.5
set rmargin 15
set lmargin 55
set arrow 1 from 0 to 61000 nohead
#plot "tpcc_trace_nskew_novo.txt" u 1:($3 > 240000. ?0:($3 > 40000. ?($3-20000):$3)) notitle with points pointtype 7 pointsize 0.5 lt rgb "blue"    #Change here
#plot "tpcc_trace_nskew_novo.txt" u ($1 > 15000000. ?($1-15000000):1):3 notitle with points pointtype 7 pointsize 0.5 lt rgb "blue"    #Change here
plot "logplot.txt"  using 1:3 notitle with points pointtype 7 pointsize 0.5 lt rgb "blue"    #Change here

#set ylabel "Page updated (identifier)" offset -10,0 font ",30"
#plot "testeU.out" using 1:3 notitle with points pointtype 7 pointsize 0.5 lt rgb "green"    #Change here
#unset multiplot
