function [c,f,s]=pdeWPP(x,t,u,DuDx)
k0=0.067;
g=1;
K=1;
d=1;
c=[1;1];
f=[0.1;10].*DuDx;
s=[u(2)*(k0+g*u(1)^2/(K^2+u(1)^2))-d*u(1);
    -u(2)*(k0+g*u(1)^2/(K^2+u(1)^2))+d*u(1)];