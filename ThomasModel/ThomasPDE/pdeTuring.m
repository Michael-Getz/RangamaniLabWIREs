function [c,f,s]=pdeTuring(x,t,u,DuDx)
b=100;
alp=1.5;
cm=80;
p=13;
K=0.125;
c=[1;1];
f=[0.1;10].*DuDx;
s=[b-u(1)-p*u(1)*u(2)/(1+u(1)+K*u(1)^2);
    alp*(cm-u(2))-p*u(1)*u(2)/(1+u(1)+K*u(1)^2)];