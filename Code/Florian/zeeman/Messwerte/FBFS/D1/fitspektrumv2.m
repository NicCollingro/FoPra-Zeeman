clc
clearvars
D1=importdata("messung12AD1.dat")
D1(:,1)=1.9e-9*D1(:,1).*D1(:,1)+1.62e-4*D1(:,1)-0.186

outliers = excludedata(D1(:,1),D1(:,2),'domain',[-0.1 1]);
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
a=4.8e4;
b=.14;
c=0.055;

d=4.8e4;
e=.31;
f=0.057;

g=5.6e4;
h=.68;
k=0.05;

l=5e4;
m=.85;
n=0.05;

o=2e4;

xf = linspace(-0.05,1,1000);
xf-b
yf = o+a*exp(-(xf-b).^2/(2*c^2))+d*exp(-(xf-e).^2/(2*f^2))+g*exp(-(xf-h).^2/(2*k^2))+l*exp(-(xf-m).^2/(2*n^2));
p1 = plot (xf , yf , ' -R ', "LineWidth", 1.5);
hold off