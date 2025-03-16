clc
clearvars
FPIscandata=importdata("FPI_scan_data.dat");







box on
plot(FPIscandata(:,1),FPIscandata(:,2), "Color", "black", "LineWidth",2.5)
xlabel("integer value", "Interpreter", "latex")
ylabel("transmitted intensity [a.u.]","Interpreter", "latex")
yticks([0 1e4 2e4 3e4 4e4 5e4 6e4 7e4])
yticklabels(["0" "1" "2" "3" "4" "5" "6" "7"])
%
xlim([0 5500])
xticks([0 1000 2000 3000 4000 5000])
%xticklabels(["50" "60" "70" "80" "90" "100" "110" "120"])
ax = gca; 
ax.FontSize = 27;
ax.LineWidth=1.5;
box on