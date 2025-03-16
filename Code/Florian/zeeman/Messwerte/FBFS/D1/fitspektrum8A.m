clc
clearvars

D1=importdata("messung8AD1.dat")
D1(:,1)=1.9e-9*D1(:,1).*D1(:,1)+1.62e-4*D1(:,1)-0.186;

outliers = excludedata(D1(:,1),D1(:,2),'domain',[0.3 1.2]);

ft=fittype("a*exp(-(x-b)^2/(2*c^2))+d*exp(-(x-e)^2/(2*f^2))+g*exp(-(x-h)^2/(2*k^2))+l*exp(-(x-m)^2/(2*n^2))+o",...
    independent="x", coefficients=["a" "b" "c" "d" "e" "f" "g" "h" "k" "l" "m" "n" "o"]);

D1ex=D1(~outliers,1);
D1ey=D1(~outliers,2);
plot(D1ex,D1ey)
hold on
myfit=fit(D1ex,D1ey,ft,...
    "StartPoint", [2.4e4, .51, 0.036, 2.4e4, .617, 0.05, 2.1e4, .831, 0.04, 2.6e4, .95, 0.05, 2.2e3])%,...
          %"Lower",[4e4,   1,     0.03,  4.5e4, 1.12,  0.03,  3.9e4, 1.45,  0.03, 5.2e4, 1.57, 0.03 10e3],...
          %"Upper",[5e4,   1.05,  0.1,   5.1e4, 1.18,  0.10,  4.5e4, 1.65,  0.10, 5.6e4, 1.68, 0.10 14e3])

xf = linspace(.3,1.2,1000); % Erzeuge Funktionswerte aus
yf = feval (myfit , xf ) ;

p1 = plot (xf , yf , ' -R ', "LineWidth", 1.5);