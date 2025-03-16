clc
clearvars
FSR=readmatrix("/home/niccollingro/Documents/FoPra/FoPra-Zeeman/Data/ComputerGeneratedData/FSR_0A/FPI_scan_data.dat");

hold on;

fitFunc = fittype("(a ./((x.^2 - b.^2).^2 + c) + d ./((x.^2 - e.^2).^2 + f) + g ./((x.^2 - h.^2).^2 + k))+l", ...
    coefficients=["a" "b" "c" "d" "e" "f" "g" "h" "k" "l"], independent="x");

myfit = fit(FSR(:,1), FSR(:,2), fitFunc, "StartPoint", [4.6e4 ,3000, 100, 4.3e4, 8500, 100, 4e4, 14000, 100, 0], ...
    "Lower", [4.4e4 ,2500, 0, 4.1e4, 7500, 0, 3.8e4, 13000, 0, 0], ...
    "Upper", [4.8e4 ,4000, 900, 4.5e4, 9200, 900, 4.2e4, 14500, 900, 1e4])

function y = myFunction(x, a, b, c, d, e, f, g, h, k, l)
    y = (a ./ ((x.^2 - b.^2).^2 + c)) + ...
        (d ./ ((x.^2 - e.^2).^2 + f)) + ...
        (g ./ ((x.^2 - h.^2).^2 + k)) + l;
end


xf = linspace(0,15000,1000); % Erzeuge Funktionswerte aus
yf = feval (@myFunction, xf, myfit(0),myfit(1),myfit(2),myfit(3),myfit(4),myfit(5),myfit(6),myfit(7),myfit(8),myfit(9));
p1 = plot (xf , yf , ' -R ', "LineWidth", 3, "Color","red");
plot(FSR(:,1),FSR(:,2),".","color","#004877","MarkerSize",10);
xlabel("Integer value", "Interpreter", "latex")
ylabel("Intensity value","Interpreter", "latex")
yticks([0 1e4 2e4 3e4 4e4 5e4 6e4])
yticklabels(["0" "1" "2" "3" "4" "5" "6"])

ax = gca; 
ax.FontSize = 27;
ax.LineWidth=1.5;
box on