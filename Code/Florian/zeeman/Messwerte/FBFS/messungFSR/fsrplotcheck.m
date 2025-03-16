clc
clearvars
FSR=importdata("FPI_scan_data.dat");
FSR(:,1)=1.9e-9*FSR(:,1).^2+1.62e-4*FSR(:,1)-0.186;
plot(FSR(:,1),FSR(:,2))