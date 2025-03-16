#!/bin/tcsh -f
 
foreach n (7AD1 7AD_2 8AD1 9AD1 10AD1 12AD1)

cat << EOF | gnuplot -p
plot "messung${n}.dat" us 1:2
EOF
end
