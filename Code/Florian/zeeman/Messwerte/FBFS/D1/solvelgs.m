clc
clearvars

fitpara=importdata("linfitparameter.dat")
coeff=0.5*[-1 -1; 1 -1; -1 1; 1 1]
g=linsolve(coeff,fitpara(:,1))
coeff*g
gex=[2/3 2]'
coeff*gex