clear
syms x k0 g koff K p
A=solve(-(k0+g+koff)*x^3+(p*k0+p*g)*x^2-(k0*K^2+koff*K^2)*x+p*k0*K^2==0,x);
m=100;%lower these values for fater evaluation
n=100;
Kc=1;
koffc=1;
k0c=linspace(0,0.14,m);
gc=1;
pc=linspace(0,5,n);
for j=1:length(k0c)
    for i=1:length(pc)
        K=Kc;
        koff=koffc;
        k0=k0c(j);
        g=gc;
        p=pc(i);
        aS=subs(A);
        a(:,i,j)=double(aS);
        u(:,i,j)=p-a(:,i,j);
    end
end

ind= u>=0 & a>=0;
ind2 = imag(a)<=10^(-20) & imag(a)>=-10^(-20);
up = u;
up(~ind) = NaN;
up(~ind2) = NaN;

ap = a;
ap(~ind) = NaN;
ap(~ind2) = NaN;

chnan=any(isnan(ap));

figure1 = figure;
axes1 = axes('Parent',figure1,'FontSize',24);
box(axes1,'on');
hold(axes1,'on');
% Create ylabel
ylabel('a');
% Create xlabel
xlabel('k0');
% Create multiple lines using matrix input to plot
plot1 = plot(k0c(1:43),squeeze(ap(:,50,1:43)),'LineWidth',3,'Parent',axes1); %change second index in call to change plotted p value
set(plot1(3),'LineStyle','--','Color',[0 0 0]);                 %1:43 was used o 'zoom onto the region of interest
set(plot1(2),'Color',[0.466666668653488 0.674509823322296 0.18823529779911]);

figure2 = figure;
axes2 = axes('Parent',figure2,'FontSize',24);
box(axes2,'on');
hold(axes2,'on');
% Create ylabel
ylabel('a');
% Create xlabel
xlabel('k0');
% Create multiple lines using matrix input to plot
plot2 = plot(k0c(1:43),squeeze(ap(:,55,1:43)),'LineWidth',3,'Parent',axes2);
set(plot2(3),'LineStyle','--','Color',[0 0 0]);
set(plot2(2),'Color',[0.466666668653488 0.674509823322296 0.18823529779911]);

figure3 = figure;
axes3 = axes('Parent',figure3,'FontSize',24);
box(axes3,'on');
hold(axes3,'on');
% Create ylabel
ylabel('a');
% Create xlabel
xlabel('k0');
% Create multiple lines using matrix input to plot
plot3 = plot(k0c(1:43),squeeze(ap(:,60,1:43)),'LineWidth',3,'Parent',axes3);
set(plot3(3),'LineStyle','--','Color',[0 0 0]);
set(plot3(2),'Color',[0.466666668653488 0.674509823322296 0.18823529779911]);

figure %[use when equal intervals on b and c]
spy(squeeze(~chnan))
xlabel('k_0')
ylabel('p')
set(gca,'YDir','normal')
set(gca,'XTick',0:50:100)
set(gca,'XTickLabel',0:0.07:0.14)
set(gca,'YTick',0:50:100)
set(gca,'YTickLabel',0:2.5:5)