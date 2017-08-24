t=linspace(0,100,1000);
x=linspace(0,16,160);
m = 0;
sol = pdepe(m,@pdeca_camp,@pdeca_campIC,@pdeca_campBC,x,t);

u1 = sol(:,:,1);
figure
surf(x,t,u1)
view(2)
shading interp
title('u1(x,t)')
xlabel('Distance x')
ylabel('Time t')
%colormap(flipud(bone))
%caxis([0 2])
u2 = sol(:,:,2);
figure
surf(x,t,u2)
view(2)
shading interp
title('u2(x,t)')
xlabel('Distance x')
ylabel('Time t')
%colormap(flipud(bone))
%caxis([0 2])
u3 = sol(:,:,3);
figure
surf(x,t,u3)
view(2)
shading interp
title('u3(x,t)')
xlabel('Distance x')
ylabel('Time t')
%colormap(flipud(bone))
%caxis([0 2])
u4 = sol(:,:,4);
figure
surf(x,t,u4)
view(2)
shading interp
title('u4(x,t)')
xlabel('Distance x')
ylabel('Time t')
%colormap(flipud(bone))
%caxis([0 2])