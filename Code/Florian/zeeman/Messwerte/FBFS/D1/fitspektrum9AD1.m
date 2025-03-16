clc
clearvars

D1=importdata("/home/niccollingro/Documents/FoPra/FoPra-Zeeman/Data/ComputerGeneratedData/FSR_9A_D1_2/FPI_scan_data.dat");
D1.data(:,1)=1.9e-9 .* D1.data(:,1) .* D1.data(:,1) + 1.62e-4 .* D1.data(:,1) - 0.186;

outliers = excludedata(D1.data(:,1),D1.data(:,2),'domain',[1 2]);

ft=fittype("a*exp(-(x-b)^2/(2*c^2))+d*exp(-(x-e)^2/(2*f^2))+g*exp(-(x-h)^2/(2*k^2))+l*exp(-(x-m)^2/(2*n^2))+o",...
    independent="x", coefficients=["a" "b" "c" "d" "e" "f" "g" "h" "k" "l" "m" "n" "o"]);

D1ex=D1.data(~outliers,1);
D1ey=D1.data(~outliers,2);
plot(D1ex,D1ey)
hold on
myfit=fit(D1ex,D1ey,ft,...
    "StartPoint", [7.4e4, 1.4, 0.038, 7e4, 1.34, 0.055, 7.1e4, 1.78, 0.04, 8.1e4, 1.9, 0.053, 2.2e3],...
          "Lower",[4e4,   1.3,     0.03,  5e4, 1.4,  0.03,  4.9e4, 1.7,  0.03, 5.2e4, 1.85, 0.03 10e3],...
          "Upper",[8e4,   1.5,  0.1,   7.1e4, 1.6,  0.10,  5e4, 1.85,  0.10, 7e4, 2, 0.10 20e3])

xf = linspace(1,2,1000); % Erzeuge Funktionswerte aus
yf = feval (myfit , xf ) ;

p1 = plot (xf , yf , ' -R ', "LineWidth", 1.5);
hold off
