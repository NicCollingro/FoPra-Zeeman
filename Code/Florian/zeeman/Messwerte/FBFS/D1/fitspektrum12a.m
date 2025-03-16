clc
clearvars

D1=importdata("/home/niccollingro/Documents/FoPra/FoPra-Zeeman/Data/ComputerGeneratedData/FSR_12A_D1/FPI_scan_data.dat")
D1.data(:,1)=1.9e-9*D1.data(:,1).*D1.data(:,1)+1.62e-4*D1.data(:,1)-0.186;

outliers = excludedata(D1.data(:,1),D1.data(:,2),'domain',[-0.1 1]);

ft=fittype("a*exp(-(x-b)^2/(2*c^2))+d*exp(-(x-e)^2/(2*f^2))+g*exp(-(x-h)^2/(2*k^2))+l*exp(-(x-m)^2/(2*n^2))+o",...
    independent="x", coefficients=["a" "b" "c" "d" "e" "f" "g" "h" "k" "l" "m" "n" "o"]);

D1ex=D1.data(~outliers,1);
D1ey=D1.data(~outliers,2);
myfit=fit(D1ex,D1ey,ft,...
    "StartPoint", [5.7e4, 0.23, 0.055, 6.1e4, .38,  0.057, 4.1e4, 0.77, 0.05, 4e4,   0.9, 0.05, 2e4],...
          "Lower",[4.5e4, 0.1,  0.03,  4.5e4, .25,  0.03,  4e4, 0.6,  0.03, 3.8e4, 0.8,  0.03  15e3],...
          "Upper",[5.8e4,   0.25,  0.1,   6.2e4, .4,  0.10,  4.5e4,   0.8, 0.10, 4.2e4, 1,  0.10  25e3])

xf = linspace(-0.05,1,1000); % Erzeuge Funktionswerte aus
yf = feval (myfit , xf ) ;


hold on
FSR=64.44e9
%FSR=1
p1 = plot (xf*FSR , yf , ' -B ', "LineWidth", 3);
plot(D1ex*FSR,D1ey,"k", "MarkerSize", 8, "LineWidth",2)
hold off
box on
xlim([0.05*FSR 1*FSR])
xlabel("frequency $\nu$ [GHz]", "Interpreter", "latex")
ylabel("transmitted intensity [a.u.]","Interpreter", "latex")
yticks([0 1e4 2e4 3e4 4e4 5e4 6e4 7e4])
yticklabels(["0" "1" "2" "3" "4" "5" "6" "7"])

xticks([1e10 2e10 3e10 4e10 5e10 6e10 7e10 8e10 9e10 10e10 11e10 12e10])
xticklabels(["10" "20" "30" "40" "50" "60" "70" "80" "90" "100" "110" "120"])
ax = gca; 
ax.FontSize = 27;
ax.LineWidth=1.5;
box on