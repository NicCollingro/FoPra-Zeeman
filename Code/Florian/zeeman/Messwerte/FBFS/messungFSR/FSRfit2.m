clc
clearvars
FSR=importdata("FPI_scan_data.dat");
xtmp=-FSR(:,1);
FSR(:,1)=xtmp+15000*ones(290,1);

hold on

ft = fittype ( "g*a^2*b^2./((x.^2-a.^2).^2+a^2*b^2)+h*c^2*d^2./((x.^2-c.^2).^2+c^2*d^2)+k*e^2*f^2./((x.^2-e.^2).^2+e^2*f^2)+m",...
    coefficients=["a" "b" "c" "d" "e" "f" "g" "h" "k" "m"] , independent="x"); 

myfit=fit(FSR(:,1),FSR(:,2),ft,"StartPoint",[13850 1000 8300 1000 3150 1000 5e4 5.6e4 5.9e4 -5000],...
    "Lower",[13840, 800 8200 750 3050 600 50800 53700 58900 -10000],...
    "Upper", [13890, 1500 8310 1100 3200 1100 57000 59000 61500 0])

xf = linspace(0,15000,1000); % Erzeuge Funktionswerte aus
yf = feval (myfit , xf ) ;
p1 = plot ( 15000*ones(290,1)-xf , yf , ' -R ', "LineWidth", 4, "Color","blue");
plot(15000*ones(290,1)-FSR(:,1),FSR(:,2),".","color","black","MarkerSize",15);
xlabel("integer value", "Interpreter", "latex")
ylabel("transmitted intensity [a.u.]","Interpreter", "latex")
yticks([0 1e4 2e4 3e4 4e4 5e4 6e4])
yticklabels(["0" "1" "2" "3" "4" "5" "6"])

ax = gca; 
ax.FontSize = 27;
ax.LineWidth=1.5;
box on