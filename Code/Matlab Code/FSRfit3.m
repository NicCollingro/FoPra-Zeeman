clc
clearvars
FSR=readmatrix("/home/niccollingro/Documents/FoPra/FoPra-Zeeman/Data/ComputerGeneratedData/FSR_0A/FPI_scan_data.dat");
%xtmp=-FSR(:,1);
%FSR(:,1)=xtmp+15000*ones(290,1);

hold on

ft = fittype ( "g*a^2*b^2./((x-a).^2+a^2*b^2)+h*c^2*d^2./((x-c).^2+c^2*d^2)+k*e^2*f^2./((x-e).^2+e^2*f^2)+m",...
    coefficients=["a" "b" "c" "d" "e" "f" "g" "h" "k" "m"] , independent="x"); 

myfit=fit(FSR(:,1),FSR(:,2),ft,"StartPoint",[3300 15 8500 15 13350 15 4.6e4 4.4e4 3.9e4 -5000],...
    "Lower",[3000, 0 8000 0 13000 0 40000 40000 38000 -10000],...
    "Upper", [3500, 150 9000 110 14000 110 4.8e4 4.5e4 4.1e4 0])

xf = linspace(0,max(FSR(:,1)),1000); % Erzeuge Funktionswerte aus
yf = feval (myfit , xf ) ;
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