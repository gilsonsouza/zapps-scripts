reset
set title "TPC-C without Skew"
set xlabel "Pages" # Used to avoid technique names to be occluded
set ylabel "Page access"
set ytics format "%.1s%c"
set grid
unset key #inside left # Where the description of the plot is
set terminal png truecolor
set output "histogram.png"
set style data histogram
set style histogram cluster gap 1
set xtic rotate by -90 scale 0
set style fill solid border rgb "black"
set auto x
set yrange [0:*]
plot 'histogram.txt' using 2:xtic(1) title col linecolor rgb "grey"
#plot 'ins_10.dat' using 2:xtic(1) title col linecolor rgb "grey", \
#        '' using 3:xtic(1) title col linecolor rgb "black"
