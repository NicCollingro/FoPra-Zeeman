A=importdata("peakheights")
C=importdata("peakwidths")

F=[1 2 3 5];
O=[1 2 3 5];
Ap=A(O,F)
Cp=C(O,F)

Axi=Ap.*Cp;

r=1./[Ap(:,2)./Ap(:,1) Ap(:,3)./Ap(:,4) ]
%rp=1./[Axi(:,2)./Axi(:,1) Axi(:,3)./Axi(:,4) ]

%S=size(O);
%sumvec=1/S(2)*ones(1,S(2));


%av2=sumvec*rp

%Arel=A(O,:)./(A(O,2)*(ones(1,7)))
%Crel=C(O,:)./(C(O,2)*(ones(1,7)))

%Eder=Arel.*Crel
%Eder(:,3)./Eder(:,6)
%Arel(:,3)./Arel(:,6)

Arsch=[A(F,1),A(F,2),A(F,4), A(F,2)./A(F,4) ,A(F,7),A(F,4), A(F,7)./A(F,4)]


U=[Arsch(:,4).*(1./Arsch(:,2)+1./Arsch(:,3)) Arsch(:,7).*(1./Arsch(:,5)+1./Arsch(:,6))]*0.1

av1=sumvec*[Arsch(:,[4 7])]
avu=sumvec*U