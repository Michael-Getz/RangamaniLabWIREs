clear all
syms g c a e z N1 N2 K1 K2 Da Db Dc Dd k w b d f l x
A=solve((-g*z^N2/(z^N2+K2^N2) - Dd*k^2 - l)*(-b-Da*k^2-l)*(-d-Db*k^2-l)*(-f-Dc*k^2-l)+a*e*c*g*N2*z^(N2-1)*K2^N2/(z^N2+K2^N2)^2*w*N1*x^(N1-1)*K1^N1/(x^N1+K1^N1)^2==0,l)
b=0.5;
c=0.45;
d=1; e=1; f=0.5; g=2; h=0.11;
K1=2;
K2=0.2;
N1=3;
N2=5;
a=2;

xi=1;
yi=0.05;
zi=0.1;
wi=0.5;
Vi=[xi yi zi wi];

V=fsolve(@(Vi) Casys(Vi,a),Vi);
x=V(1); y=V(2); z=V(3); w=V(4);

Da=444;
Db=0.1;
Dc=530;
Dd=0.1;
kv=linspace(0,1,100);
for i=1:length(kv)
    clear k
    k=kv(i);
    L=subs(A);
    lambda=double(L);
    l(i)=max(imag(lambda));
    r(i)=max(real(lambda));
end
figure
plot(kv,l)
figure
plot(kv,r)