clc
clearvars
FSR=importdata("FPI_scan_data.dat");
plot(FSR(:,1),FSR(:,2));
hold on

ft = fittype ( "a*exp(-c*(x-b).^2)+d*exp(-e*(x-f).^2)+g*exp(-h*(x-k).^2)",...
    coefficients=["a" "b" "c" "d"  "e" "f" "g"  "h" "k"], independent="x");

myfit=fit(FSR(:,1),FSR(:,2),ft,"StartPoint",[5.1e4, 1100, 2e-6, 54530, 2e-6, 6700, 60000, 2e-6, 12000],...
    "Lower",[5e4, 1100, 1e-6, 53000, 1e-6, 6650, 58500, 1e-6, 11700], "Upper", [50100 1190 3e-6 53500 3e-6 6850 58600 3e-6 11900])

xf = linspace(0,15000,1000); % Erzeuge Funktionswerte aus
yf = feval (myfit , xf ) ;
%p1 = plot ( xf , yf , ' -b ')