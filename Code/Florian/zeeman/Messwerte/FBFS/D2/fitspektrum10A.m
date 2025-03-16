clc
clearvars

D1=importdata("/home/niccollingro/Documents/FoPra/FoPra-Zeeman/Data/ComputerGeneratedData/FSR_10A_D2/FPI_scan_data.dat")
D1.data(:,1)=1.9e-9*D1.data(:,1).*D1.data(:,1)+1.62e-4*D1.data(:,1)-0.186;

O=[0.7 1.8]
outliers = excludedata(D1.data(:,1),D1.data(:,2),'domain',O);

ft=fittype("a*exp(-(x-b)^2/(2*c^2))+d*exp(-(x-e)^2/(2*f^2))+g*exp(-(x-h)^2/(2*k^2))+l*exp(-(x-m)^2/(2*n^2))+o+p*exp(-(x-q)^2/(2*r^2))+s*exp(-(x-t)^2/(2*u^2))",...
    independent="x", coefficients=["a" "b" "c" "d" "e" "f" "g" "h" "k" "l" "m" "n" "p" "q" "r" "s" "t" "u" "o"]);
Af=[24000	0.950000000000000	0.0550000000000000	65000	1.01500000000000	0.0450000000000000	65000	1.2700000000000	0.0500000000000000	65000	1.4100000000000	0.0500000000000000	53000	1.55000000000000	0.0500000000000000	31000	1.69000000000000	0.0500000000000000	15000]
AfUpper = [27000	1.0	0.0550000000000000	50000	1.1400000000000	0.0450000000000000	50000	1.300000000000	0.0500000000000000	50000	1.42700000000000	0.0500000000000000	50000	1.6000000000000	0.0500000000000000	27000	1.72000000000000	0.0500000000000000	15000]
AfLower = [23000	0.98000000000000	0.0550000000000000	45000	1.01500000000000	0.0450000000000000	45000	1.15500000000000	0.0500000000000000	45000	1.35700000000000	0.0500000000000000	45000	1.5000000000000	0.0500000000000000	23000	1.65000000000000	0.0500000000000000	15000]

D1ex=D1.data(~outliers,1);
D1ey=D1.data(~outliers,2);
myfit=fit(D1ex,D1ey,ft,...
    "StartPoint", Af,...
          "Lower",AfLower,...
          "Upper",AfUpper)

coefffvals=coeffvalues(myfit);
format short
peakpos=coefffvals([2 5 8 11 14 17])
peakh=coefffvals([1 4 7 10 13 16])
peakw=coefffvals([3 6 9 12 15 18])

xf = linspace(O(1),O(2),1000); % Erzeuge Funktionswerte aus
yf = feval (myfit , xf ) ;


hold on
FSR=64.44e9
%FSR = 1
p1 = plot (xf*FSR , yf , ' -B ', "LineWidth", 3);
plot(D1ex*FSR,D1ey,"k", "MarkerSize", 8, "LineWidth",2)
hold off
box on
xlim(FSR*O)
xlabel("frequency $\nu$ [GHz]", "Interpreter", "latex")
ylabel("transmitted intensity [a.u.]","Interpreter", "latex")
yticks([0 1e4 2e4 3e4 4e4 5e4 6e4 7e4 8e4])
yticklabels(["0" "1" "2" "3" "4" "5" "6" "7" "8"])

xticks([5e10 6e10 7e10 8e10 9e10 10e10 11e10 12e10])
xticklabels(["50" "60" "70" "80" "90" "100" "110" "120"])
ax = gca; 
ax.FontSize = 27;
ax.LineWidth=1.5;
box on