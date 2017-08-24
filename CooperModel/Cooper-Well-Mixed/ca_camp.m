function [t,C]=ca_camp(a)
tspan=linspace(0,100,200);
Cinit=[1, 0.05, 0.1, 0.5];
%Cinit=[1.093, 0.0632, 0.1263, 0.2733];
[t,C]=ode23s(@odefun,tspan,Cinit,'',a);

function dCdt=odefun(t,C,a)
 b=0.5; cm=0.45; d=1;e=1;f=0.5; gm=2;h=0.11; k1=2; k2=0.2; N1=3; N2=3;

x=C(1); y=C(2); z=C(3); w=C(4);
c=cm*x^N1/(x^N1+k1^N1);
g=gm*z^N2/(z^N2+k2^N2);

dCdt=[a*w-b*x
    c-d*y
    e*y-f*z
    h-g*w];
 