clc 
clearvars
peakpos=importdata("peakpositionen.dat");
sumvec=[0 1 1 1 1 0 0 0 0]
MW=peakpos*sumvec'/4;
MW*sumvec;
peakposkorr=peakpos-MW*sumvec;
FSR=64.440e9
peakposkorr=peakposkorr*diag([0.0825,FSR, FSR,FSR,FSR,FSR, FSR,FSR,FSR])-0.001*ones(5,1)*[1 0 0 0 0 0 0 0 0]

DeltaB=0.008*ones(5,1)+0.001*peakpos(:,1)+0.25*0.0825*ones(5,1);

xf=linspace(6*0.084,13*0.084,1000);
ft=fittype("a*x", independent="x", coefficients=["a"])

F=[1 2 3 4 5]
myfit1=fit(peakposkorr(F,1),7.1447e-11*peakposkorr(F,2),ft)
yf1=feval(myfit1, xf);
myfit2=fit(peakposkorr(F,1),7.1447e-11*peakposkorr(F,3),ft)
yf2=feval(myfit2, xf);
myfit3=fit(peakposkorr(F,1),7.1447e-11*peakposkorr(F,4),ft)
yf3=feval(myfit3, xf);
myfit4=fit(peakposkorr(F,1),7.1447e-11*peakposkorr(F,5),ft)
yf4=feval(myfit4, xf);

hold on


%errorbar( B_Tesla(:,1),B_Tesla(:,2), B_error, B_error, I_error, I_error,"LineStyle","none","LineWidth", 1.5, "Color", "Black")

plot(xf,yf1/7.1447e-11,"LineWidth", 2.9)
plot(xf,yf2/7.1447e-11,"LineWidth", 2.9)
plot(xf,yf3/7.1447e-11,"LineWidth", 2.9)
plot(xf,yf4/7.1447e-11,"LineWidth", 2.9)

errorbar(peakposkorr(:,1),peakposkorr(:,2),peakposkorr(:,6),peakposkorr(:,6),DeltaB,DeltaB,"LineStyle","none","LineWidth", 2.5, "Color", "Black")

errorbar(peakposkorr(:,1),peakposkorr(:,3),peakposkorr(:,7),peakposkorr(:,7),DeltaB,DeltaB,"LineStyle","none","LineWidth", 2.5, "Color", "Black")
errorbar(peakposkorr(:,1),peakposkorr(:,4),peakposkorr(:,8),peakposkorr(:,8),DeltaB,DeltaB,"LineStyle","none","LineWidth", 2.5, "Color", "Black")
errorbar(peakposkorr(:,1),peakposkorr(:,5),peakposkorr(:,9),peakposkorr(:,9),DeltaB,DeltaB,"LineStyle","none","LineWidth", 2.5, "Color", "Black")

hold off
xlabel("magnetic fiel $B$ [T]","Interpreter","latex")
ylabel("frequency shift $\Delta\nu$ [GHz]","Interpreter","latex")

yticks([-25e9 -2e10 -1.5e10 -1e10 -0.5e10 0 0.5e10 1e10 1.5e10 2e10 25e9])
yticklabels(["-25" "-20" "-15" "-10" "-5" "0" "5" "10" "15" "20" "25"])

xlim([0.5 1.05])
ylim([-25e9 25e9])

grid off
xticks([0.5 0.6 0.7 0.8 0.9 1 1.1])

ax = gca; 
ax.FontSize = 20;
ax.LineWidth=1.5;
box on
daspect([0.3 50e9 1])