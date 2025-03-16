clc
clearvars
D1=importdata("messung7AD2unsicher.dat");
D1(:,1)=1.9e-9*D1(:,1).*D1(:,1)+1.62e-4*D1(:,1)-0.186;

F=[0.3 1.2]
outliers = excludedata(D1(:,1),D1(:,2),'domain',F);
%ft=fittype("a*exp((x-b)^2/(2*c^2))+d*exp((x-e)^2/(2*f^2))+g*exp((x-h)^2/(2*k^2))+l*exp((x-m)^2/(2*n^2))",...
%    independent="x", coefficients=["a" "b" "c" "d" "e" "f" "g" "h" "k" "l" "m" "n"]);

D1ex=D1(~outliers,1);
D1ey=D1(~outliers,2);
plot(D1ex(:),D1ey(:))
hold on

%myfit=fit(D1ex,D1ey,ft,...
   % "StartPoint", [6.2e4, 1,    0.05, 6e4,   1.15, 0.05, 5.6e4, 1.5,  0.05, 6.6e4, 1.63, 0.05],...
%          "Lower",[6e4,   1,    0.03, 5.9e4, 1.12, 0.03, 5.5e4, 1.45, 0.03, 6.4e4, 1.57, 0.03],...
%          "Upper",[6.4e4, 1.05, 0.1,  6.2e4, 1.18, 0.10, 5.7e4, 1.65, 0.10, 6.7e4, 1.68, 0.10])
a=1.17e4;
b=.547;
c=0.038;

d=2.2e4;
e=.651;
f=0.036;

g=2.5e4;
h=.745;
k=0.038;

l=2.5e4;
m=.845;
n=0.037;

p=2.35e4;
q=.938;
r=0.037;

s=1.4e4;
t=1.04;
u=0.04;

o=0.2e4;
format long
A=[a b c d e f g h k l m n p q r s t u o]

xf = linspace(F(1),F(2),1000);
yf = o+a*exp(-(xf-b).^2/(2*c^2))+d*exp(-(xf-e).^2/(2*f^2))+g*exp(-(xf-h).^2/(2*k^2))+l*exp(-(xf-m).^2/(2*n^2))+p*exp(-(xf-q).^2/(2*r^2))+s*exp(-(xf-t).^2/(2*u^2));
p1 = plot (xf , yf , ' -R ', "LineWidth", 1.5);
hold off
