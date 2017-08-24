clear
syms x k h p b c
A=solve(-k*h/p*x^3+(k*b*h/p-h/p-1)*x^2+(b+h*b/p-h/p-h*c)*x+h*b/p==0,x);
n=40; %set to 40 for equal intervals
m=40;
kc=10;
hc=10;
pc=10;
bc=linspace(0,10,m); %equal intervals
cc=linspace(0,10,n);
% bc=[linspace(0,6.75,20) linspace(7,7.5,10) linspace(7.75,10,10)]; %unequal intervals, if desired; plotting 
% cc=[linspace(0,4,10) linspace(4.5,5,10) linspace(5.25,8,10) linspace(8,9,20) 9.5 10];%breaks some calls
for j=1:length(bc)
    for i=1:length(cc)
        k=kc;
        h=hc;
        p=pc;
        b=bc(j);
        c=cc(i);
        aS=subs(A);
        a(:,i,j)=double(aS);
        u(:,i,j)=(b-a(:,i,j)).*(1+a(:,i,j)+k*a(:,i,j).^2)./(p*a(:,i,j));
        for k=1:3
            J(1:2,1:2)=[p*u(k,i,j).*(k*a(k,i,j).^2-1)./(1+a(k,i,j)+k*a(k,i,j).^2).^2-1 -p*a(k,i,j)./(1+a(k,i,j)+k*a(k,i,j).^2)
                p*u(k,i,j).*(k*a(k,i,j).^2-1)./(1+a(k,i,j)+k*a(k,i,j).^2).^2 -h-p*a(k,i,j)./(1+a(k,i,j)+k*a(k,i,j).^2)];
        end
    end
end

ind= u>=0 & a>=0; %remove all non real and imaginary answers
ind2 = imag(a)<=10^(-20) & imag(a)>=-10^(-20);
up = u;
up(~ind) = NaN;
up(~ind2) = NaN;

ap = a;
ap(~ind) = NaN;
ap(~ind2) = NaN;

chnan=any(isnan(ap)); %look for NaN entries

figure1 = figure;
axes1 = axes('Parent',figure1,'FontSize',24);
box(axes1,'on');
hold(axes1,'on');
% Create ylabel
ylabel('a');
% Create xlabel
xlabel('c');
% Create multiple lines using matrix input to plot
plot1 = plot(cc,ap(:,:,20),'LineWidth',3,'Parent',axes1); %redefine the third index in plot call to look across 
set(plot1(2),'LineStyle','--','Color',[0 0 0]);             %different b values
set(plot1(3),'Color',[0.466666668653488 0.674509823322296 0.18823529779911]);

figure2 = figure;
axes2 = axes('Parent',figure2,'FontSize',24);
box(axes2,'on');
hold(axes2,'on');
% Create ylabel
ylabel('a');
% Create xlabel
xlabel('b');
% Create multiple lines using matrix input to plot
plot2 = plot(bc,squeeze(ap(:,20,:)),'LineWidth',3,'Parent',axes2); %redefine second index in plot call to look
set(plot2(2),'LineStyle','--','Color',[0 0 0]);                     %across different c values
set(plot2(3),'Color',[0.466666668653488 0.674509823322296 0.18823529779911]);
figure %[use only when equal intervals on b and c]
spy(squeeze(~chnan)) %plots all not NaNs as ador
xlabel('b')
ylabel('c')
set(gca,'YDir','normal')
set(gca,'XTick',0:8:40)
set(gca,'XTickLabel',0:2:10)
set(gca,'YTick',0:8:40)
set(gca,'YTickLabel',0:2:10)