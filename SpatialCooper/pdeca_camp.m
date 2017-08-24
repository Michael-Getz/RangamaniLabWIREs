function [c,f,s]=pdeca_camp(x,t,u,DuDx)
b=0.75;
cm=0.45;
d=1; e=1; F=0.5; gm=2; h=0.11;
K1=2;
K2=0.2;
n1=3;
n2=3;
a=1+exp(-0.1*x);
c=[1;1;1;1];
f=[4.44; 0.0001; 5.30; 0.0001]/2.*DuDx;
s=[a*u(4)-b*u(1);
    cm*u(1)^n1/(u(1)^n1+K1^n1)-d*u(2);
    e*u(2)-F*u(3);
    h-gm*u(3)^n2/(u(3)^n2+K2^n2)*u(4)];
