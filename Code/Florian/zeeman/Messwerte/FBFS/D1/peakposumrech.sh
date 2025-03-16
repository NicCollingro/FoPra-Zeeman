#! /usr/bin/tcsh -f

cat peakpositionen.dat\
|awk -v f=64.44 '{print f*$2, f*$3, f*$4, f*$5, f*$6}'

