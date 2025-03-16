B=importdata("homogenitaet.dat")
B(:,1)=B(:,1)-5.7
xerr=0.1
yerr=ones(8,1)

errorbar(B(:,1),B(:,2),yerr,yerr,xerr,xerr, "Color", "black","LineWidth", 1.5)
ylabel("magnetic field $B$ [mT]", "Interpreter","latex")
xlabel("position along horizontal axis perpendicular to the solenoid [cm]", "Interpreter","latex")
grid off
ax = gca;
ax.FontSize = 27;
ax.LineWidth=1.5;
