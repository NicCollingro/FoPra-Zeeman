clc
clearvars

D1=importdata("/home/niccollingro/Documents/FoPra/FoPra-Zeeman/Data/ComputerGeneratedData/FSR_10A_D1/FPI_scan_data.dat")
D1.data(:,1)=1.9e-9*D1.data(:,1).*D1.data(:,1)+1.62e-4*D1.data(:,1)-0.186;

outliers = excludedata(D1.data(:,1),D1.data(:,2),'domain',[0.8 1.89]);

ft=fittype("a*exp(-(x-b)^2/(2*c^2))+d*exp(-(x-e)^2/(2*f^2))+g*exp(-(x-h)^2/(2*k^2))+l*exp(-(x-m)^2/(2*n^2))+o",...
    independent="x", coefficients=["a" "b" "c" "d" "e" "f" "g" "h" "k" "l" "m" "n" "o"]);

D1ex=D1.data(~outliers,1);
D1ey=D1.data(~outliers,2);
myfit=fit(D1ex,D1ey,ft,...
    "StartPoint", [4.6e4, 1.16, 0.048, 5e4, 1.172, 0.063, 4.1e4, 1.475, 0.05, 5.4e4, 1.625, 0.06, 12e3],...
          "Lower",[4e4,   1,     0.03,  4.5e4, 1.12,  0.03,  2e4, 1.45,  0.03, 5.2e4, 1.57, 0.03 10e3],...
          "Upper",[5e4,   1.4,  0.1,   6e4, 1.18,  0.10,  4.5e4, 1.65,  0.10, 5.6e4, 1.75, 0.10 14e3])

xf = linspace(.7,1.9,1000); % Erzeuge Funktionswerte aus
yf = feval (myfit , xf ) ;


hold on
FSR=64.44e9
%FSR=1
p1 = plot (xf*FSR , yf , ' -B ', "LineWidth", 3);
plot(D1ex*FSR,D1ey,"k", "MarkerSize", 8, "LineWidth",2)
hold off
box on
xlim([0.775*FSR 1.8625*FSR])
xlabel("frequency $\nu$ [GHz]", "Interpreter", "latex")
ylabel("transmitted intensity [a.u.]","Interpreter", "latex")
yticks([0 1e4 2e4 3e4 4e4 5e4 6e4 7e4])
yticklabels(["0" "1" "2" "3" "4" "5" "6" "7"])

xticks([5e10 6e10 7e10 8e10 9e10 10e10 11e10 12e10])
xticklabels(["50" "60" "70" "80" "90" "100" "110" "120"])
ax = gca; 
ax.FontSize = 27;
ax.LineWidth=1.5;
box on