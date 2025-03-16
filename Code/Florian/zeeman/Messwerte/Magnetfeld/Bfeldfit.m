clc
clearvars
B_gauss=importdata('Kalibration.dat')
B_Tesla=B_gauss;
B_Tesla(:,2)=B_gauss(:,2)/10000
B_error=1e-3*ones(1,20);
I_error=0.25*ones(1,20);

ft=fittype("a*x+b", coefficients=["a" "b"], independent="x")
myfit=fit( B_Tesla([1 2  4 5 6 7 8 9 10 11 12],1),B_Tesla([1 2  4 5 6 7 8 9 10 11 12],2),ft)

x=linspace(0,12,1000);
y=feval(myfit,x);


h=plot(x,y,"LineWidth", 2.5,"color", "blue");
hold on
g=errorbar( B_Tesla(:,1),B_Tesla(:,2), B_error, B_error, I_error, I_error,"LineStyle","none","LineWidth", 1.5, "Color", "Black");

xlim([-.7,20.7])
ylim([-.005, .15])
xlabel("current $I$ [A]", "Interpreter", "latex")
ylabel("magnetic field $B$ [T]", "Interpreter", "latex")
grid on
yticks([0 0.025 0.05 0.075 0.1 0.125 0.15])
yticklabels(["0" "0.25" "0.50" "0.75" "1.00" "1.25" "1.50"])

legend(["$B(I)=MI +N, \quad M=82.5(10) \frac{\mathrm{mT}}{\mathrm{A}} \, N=-1(8) \mathrm{mT}$"],"Interpreter", "latex","Location", "northwest")
ax = gca; 
ax.FontSize = 27;
ax.LineWidth=1.5;

grid off