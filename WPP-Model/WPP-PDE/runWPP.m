t=linspace(0,200,1000);%If the behavior is not occuring change the IC to
x=linspace(0,10,1000);%2.5*a for quicker results (as you are relying on a 
m = 0;                  %random distribution
sol = pdepe(m,@pdeWPP,@pdeWPPIC,@pdeTuringBC,x,t);

u1 = sol(:,:,1);
figure
surf(x,t,u1)
view(2)
shading interp
title('u1(x,t)')
xlabel('Distance x')
ylabel('Time t')
colormap(flipud(bone))
caxis([0 2.5])
u2 = sol(:,:,2);
figure
surf(x,t,u2)
view(2)
shading interp
title('u2(x,t)')
xlabel('Distance x')
ylabel('Time t')
colormap(flipud(bone))
caxis([0 2.5])
start=(sum(u1(1,:))+sum(u2(1,:)))/100
finish=(sum(u1(800,:))+sum(u2(800,:)))/100
error=abs(finish-start)/start