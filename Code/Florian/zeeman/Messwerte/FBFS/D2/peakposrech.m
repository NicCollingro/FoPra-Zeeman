clc
clearvars

peakpos=importdata("peakpos")
FSR=64.44
0.01*FSR
peakpos*diag([1,FSR,FSR,FSR,FSR,FSR,FSR])