syms x kp h p b c
A=solve(-kp*h/p*x^3+(kp*b*h/p-h/p-1)*x^2+(b+h*b/p-h/p-h*c)*x+h*b/p==0,x);
n=100; %set n=m for equal intervals
m=100;
kc=0.125;
hc=1.5;
pc=13;
D=1000000000000000;%diffusion ratio set to 1E9 as infinity substitution; plots one D condition at a time
bc=linspace(0,200,m); %equal intervals
cc=linspace(0,200,n);
T=zeros(3,length(cc),length(bc));
for j=1:length(bc)
    for i=1:length(cc)
        kp=kc;
        h=hc;
        p=pc;
        b=bc(j);
        c=cc(i);
        aS=subs(A);
        a(:,i,j)=double(aS);
        u(:,i,j)=(b-a(:,i,j)).*(1+a(:,i,j)+kp*a(:,i,j).^2)./(p*a(:,i,j));
        ind= u>=0 & a>=0;
        ind2 = imag(a)<=10^(-20) & imag(a)>=-10^(-20);
        
        uR = real(u);
        uR(~ind) = NaN;
        uR(~ind2) = NaN;
        
        aR = real(a);
        aR(~ind) = NaN;
        aR(~ind2) = NaN;
        for k=1:3
            J(1:2,1:2)=[p*uR(k,i,j).*(kp*aR(k,i,j).^2-1)./(1+aR(k,i,j)+kp*aR(k,i,j).^2).^2-1 -p*aR(k,i,j)./(1+aR(k,i,j)+kp*aR(k,i,j).^2)
                p*uR(k,i,j).*(kp*aR(k,i,j).^2-1)./(1+aR(k,i,j)+kp*aR(k,i,j).^2).^2 -h-p*aR(k,i,j)./(1+aR(k,i,j)+kp*aR(k,i,j).^2)];
if J(1,1)+J(2,2)<0 && J(1,1)*J(2,2)-J(2,1)*J(1,2)>0 && D*J(1,1)+J(2,2)>0 && (D*J(1,1)+J(2,2))^2-4*D*(J(1,1)*J(2,2)-J(2,1)*J(1,2))>0
    T(k,i,j)=1; %if all four cases are fufilled set T to 1
end
        end
    end
end

up = u;
up(~ind) = NaN;
up(~ind2) = NaN;

ap = a;
ap(~ind) = NaN;
ap(~ind2) = NaN;

chnan=any(isnan(ap));

figure %[use when equal intervals on b and c]
spy(squeeze(~chnan))
xlabel('b')
ylabel('c')
set(gca,'YDir','normal')
set(gca,'XTick',0:10:100)
set(gca,'XTickLabel',0:2:20)
set(gca,'YTick',0:10:100)
set(gca,'YTickLabel',0:2:20)
figure
spy(squeeze(T(1,:,:))')
hold on
spy(squeeze(T(3,:,:))')
set(gca,'YDir','normal')
set(gca,'XTick',0:10:100)
set(gca,'XTickLabel',0:20:200)
set(gca,'YTick',0:10:100)
set(gca,'YTickLabel',0:20:200)