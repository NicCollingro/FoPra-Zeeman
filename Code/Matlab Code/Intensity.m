clear all;
clc
clearvars
FSR=readmatrix("/home/niccollingro/Documents/FoPra/FoPra-Zeeman/Data/ComputerGeneratedData/FSR_0A/FPI_scan_data.dat");

myfitFunc = fittype("(a .* exp(-0.5 .* ((x-b) ./ c).^2) + d .* exp(-0.5 .* ((x-e) ./ f).^2) + g .* exp(-0.5 .* ((x-h) ./ j).^2) + k", ...
    coefficients=["a" "b" "c" "d" "e" "f" "g" "h" "j" "k"], independent="x");

