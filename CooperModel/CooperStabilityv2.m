clear all
b=0.75;
%b=linspace(0.01,1,60);
c=0.45;
d=1; e=1; f=0.5; g=2; h=0.11;
k1=2;
k2=0.2;
n1=3;
n2=3;
%a=[linspace(0.01,1,60) linspace(1,6,60)];
a=0.5;
xi=1;
yi=0.05;
zi=0.1;
wi=0.5;
Vi=[xi yi zi wi];
options = optimoptions('fsolve','Display','iter');
for i=1:length(b)
V(i,:)=fsolve(@(Vi) Casys(Vi,b(i)),Vi,options);
x=V(i,1); y=V(i,2); z=V(i,3); w=V(i,4);
J(1:4,1:4)=[-b(i) 0 0 a;
    c*(n1*k1^n1*x^(n1-1))/(x^n1+k1^n1)^2 -d 0 0;
    0 e -f 0;
    0 0 -g*(n2*k2^n2*z^(n2-1))/(z^n2+k2^n2)^2*w -g*z^(n2)/(z^n2+k2^n2) ];
Je(:,i)=eig(J(1:4,1:4));
end
figure
plot(b,real(Je),[0 6],[0 0])
figure
plot(b,max(real(Je(1:4,:))),[0 1],[0 0])
figure
plot(b,max(imag(Je(1:4,:))),[0 1],[0 0])
B= Je(:,max(real(Je(1:4,:)))>=0)
Apos=b(max(real(Je(1:4,:)))>=0)