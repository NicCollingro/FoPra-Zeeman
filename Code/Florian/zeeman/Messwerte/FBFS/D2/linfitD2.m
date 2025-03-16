clc
clearvars

peakpos=importdata("peakpos")
sumvec=[0 1 1 1 1 1 1];
MW=peakpos*sumvec'/6;
FSR=64.440e9
peakposkorr=peakpos-MW*sumvec
peakposkorr=peakposkorr*diag([0.0825,FSR, FSR, FSR, FSR, FSR, FSR])-0.001*ones(7,1)*[1 0 0 0 0 0 0]

O=[1 2 3  5 ];
S=size(O)
DeltaB=0.008*ones(S(2),1)+0.001*peakpos(O,1)+0.25*0.0825*ones(S(2),1);
Dnu=0.02*FSR*ones(S(2),1);

xf=linspace(0.082*6., 0.082*12.5, 1000);

ft=fittype("a*x+b", independent="x", coefficients=["a" "b"]);
ft2=fittype("a*x", independent="x", coefficients=["a"]);


yf=zeros(6,1000);

hold on
F=O;
for(i=[2 3 4 5 6 7])
myfit=fit(peakposkorr(O,1),7.1447e-11*peakposkorr(O,i),ft2)
yf(i-1,:)=feval(myfit, xf);
plot(xf,yf(i-1,:)./7.1447e-11,"LineWidth", 2.9)
errorbar(peakposkorr(F,1),peakposkorr(F,i),Dnu,Dnu,DeltaB,DeltaB,"LineStyle","none","LineWidth", 2.5, "Color", "Black")

end    

hold off

xlabel("magnetic fiel $B$ [T]","Interpreter","latex")
ylabel("frequency shift $\Delta\nu$ [GHz]","Interpreter","latex")

yticks([-25e9 -2e10 -1.5e10 -1e10 -0.5e10 0 0.5e10 1e10 1.5e10 2e10 25e9])
yticklabels(["-25" "-20" "-15" "-10" "-5" "0" "5" "10" "15" "20" "25"])

xlim([0.5 .9])
ylim([-26e9 26e9])

grid off
xticks([0.5 0.6 0.7 0.8 0.9 1 1.1])

ax = gca; 
ax.FontSize = 20;
ax.LineWidth=1.5;
box on
daspect([0.25 50e9 1])
legend off