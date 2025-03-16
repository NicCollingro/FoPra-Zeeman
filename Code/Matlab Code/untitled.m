clear all;
clc
clearvars
FSR=readmatrix("/home/niccollingro/Documents/FoPra/FoPra-Zeeman/Data/ComputerGeneratedData/FSR_9A_D2/FPI_scan_data.dat");

plot(FSR(:,1), FSR(:,2), ".")