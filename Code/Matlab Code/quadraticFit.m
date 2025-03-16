clear all;

a = 3.990e-9;
b = -4.60686e-4;
c = -1.812981892;
xValues = linspace(0, 15000, 101);
yValues = a .* xValues .^2 + b .* xValues + c;

plot(xValues, yValues)
