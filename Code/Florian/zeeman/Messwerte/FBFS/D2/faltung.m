

F=100
FSR=2
fun= @(x,m) exp(-x.^2)./(1+F*(sin(1/FSR*(x-m))).^2)
y=linspace(-6,6,500);
q=zeros(1,500);
for(i=1:1:500)
q(i) = integral(@(x) fun(x,y(i)),-10,10);
end

plot(y,q)
hold on
plot(y,.51*exp(-y.^2))