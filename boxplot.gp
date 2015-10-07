set terminal pngcairo dashed
set output "boxplot.png"
set style line 11 lc rgb '#808080' lt 1
set border 3 back ls 11
set style line 12 lc rgb '#444444' lt 0 lw 1
#set grid back ls 12
set style line 1 lc rgb '#8b1a0e' lt 1 lw 2 pt 7 ps 1 #red
set style line 2 lc rgb '#0c119c' lt 1 lw 1 pt 6 ps 1 #blue
set style line 3 lc rgb '#5e9c36' lt 1 lw 1 pt 13 ps 1 #green
set style fill transparent solid 0.2 border

unset key

set ytics nomirror
set ylabel "Page access"
#set format y "%.2sM"

set boxwidth 0.3 absolute

set xrange[0.5:8.5]
#set xtics ("base" 1, "full" 2, "nomerge" 3, "nosort" 4)
set xtics nomirror
unset mxtics
#set yrange[3000000:5500000]

plot "boxplot.txt" using (column(0)+1):3:2:6:5:xticlabels(1) with candlesticks ls 11 t "Throughput" whiskerbars, \
    '' using (column(0)+1):4:4:4:4 with candlesticks ls 2 notitle

