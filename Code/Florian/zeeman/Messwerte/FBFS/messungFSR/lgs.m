clc
clearvars
format long

xiprime=[13870 8225 3160];
xi=15000*ones(1,3)-xiprime
xi2=[1130, 6778, 11842]
A=[(xi.^2)',xi', ones(3,1)]
Aprime=[(xi2.^2)',xi2', ones(3,1)]
Y=[0 1 2]';
coeff=linsolve(A,Y)
coeffprime=linsolve(Aprime,Y)
coeffprime(3)

a=1.906136e-9
b=1.619801e-4
c=-1.854714e-1
a2=coeff(1)
b2=coeff(2)
c2=coeff(3)


x=linspace(0,15000,50000);
y=a*x.^2+b*x+c;
y2=a2*x.^2+b2*x+c2;

plot(x,y,"LineWidth",4.5)
hold on
%plot(x,y2,"LineWidth",1)

xlabel("integer value $x$", "Interpreter", "latex")
ylabel("frequency shift $\Delta\nu$ [FSR]","Interpreter", "latex")
yticks([0 1 2 3])
yticklabels(["0" "1" "2" "3"])

ax = gca; 
ax.FontSize = 27;
ax.LineWidth=1.5;
%legend("Correction function $f(x)=ax^2+bx+c$", "Interpreter","latex","location","northwest")
box on