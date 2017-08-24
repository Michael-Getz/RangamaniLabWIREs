t=linspace(0,1000,8000);
x=linspace(0,10,100);
m = 0;
sol = pdepe(m,@pdeTuring,@pdeTuringIC,@pdeTuringBC,x,t);

u1 = sol(:,:,1);
figure
surf(x,t,u1)
view(2)
shading interp
title('u1(x,t)')
xlabel('Distance x')
ylabel('Time t')
%colormap(flipud(bone))
caxis([0 55])
u2 = sol(:,:,2);
figure
surf(x,t,u2)
view(2)
shading interp
title('u2(x,t)')
xlabel('Distance x')
ylabel('Time t')
%colormap(flipud(bone))
caxis([0 55])