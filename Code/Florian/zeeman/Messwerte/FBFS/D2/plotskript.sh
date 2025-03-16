#!/bin/tcsh -f
 
foreach n (9AD2 7AD2 7AD2unsicher 8AD2 8AD2_1 10AD2 10AD2_2)
cat << EOF | gnuplot -p
plot "messung${n}.dat" us 1:2
EOF
end
