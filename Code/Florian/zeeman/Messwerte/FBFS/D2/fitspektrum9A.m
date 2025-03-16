clc
clearvars

D1=importdata("/home/niccollingro/Documents/FoPra/FoPra-Zeeman/Data/ComputerGeneratedData/FSR_9A_D2_2/FPI_scan_data.dat")
D1.data(:,1)=1.9e-9*D1.data(:,1).*D1.data(:,1)+1.62e-4*D1.data(:,1)-0.186;

O=[0.3 1.3]
outliers = excludedata(D1.data(:,1),D1.data(:,2),'domain',O);

ft=fittype("a*exp(-(x-b)^2/(2*c^2))+d*exp(-(x-e)^2/(2*f^2))+g*exp(-(x-h)^2/(2*k^2))+l*exp(-(x-m)^2/(2*n^2))+o+p*exp(-(x-q)^2/(2*r^2))+s*exp(-(x-t)^2/(2*u^2))",...
    independent="x", coefficients=["a" "b" "c" "d" "e" "f" "g" "h" "k" "l" "m" "n" "p" "q" "r" "s" "t" "u" "o"]);


Af=[20000	0.465000000000000	0.0460000000000000	37000	0.594000000000000	0.0420000000000000	36000	0.710000000000000	0.0400000000000000	37000	0.830000000000000	0.0500000000000000	35000	0.950000000000000	0.0400000000000000	24000	1.07000000000000	0.0500000000000000	5000]


D1ex=D1.data(~outliers,1);
D1ey=D1.data(~outliers,2);
myfit=fit(D1ex,D1ey,ft,...
    "StartPoint", Af,...
          "Lower",0.7*Af,...
          "Upper",1.4*[Af])

coefffvals=coeffvalues(myfit);
format short
peakpos=coefffvals([2 5 8 11 14 17])
peakh=coefffvals([1 4 7 10 13 16])
peakw=coefffvals([3 6 9 12 15 18])

xf = linspace(O(1),O(2),1000); % Erzeuge Funktionswerte aus
yf = feval (myfit , xf ) ;


hold on
FSR=64.44e9
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