clear %clear workspace 4th order RK scheme
a=0.1:0.1:10; %define a ranges
h=0.01;%define timestep
T=500;%final time
N=T/h;%number of steps
t=zeros(1,N+1);%initialize time
x = zeros(4,4,N+1);%initialize x
f = zeros(4,4,N);%initialize f
x(:,1,1) = [1 0.05 0.1 0.5];%initial values [x y z w]
 b=0.75; cm=0.45; d=1;e=1;fp=0.5; gm=2;hp=0.11; k1=2; k2=0.2; N1=3; N2=3; %define parameters
for k = 1:length(a)
    for i = 1:N
        for j= 1:4
            f(:,j,i) = [a(k)*x(4,j,i)-b*x(1,j,i) cm*x(1,j,i)^N1/(x(1,j,i)^N1+k1^N1)-d*x(2,j,i) e*x(2,j,i)-fp*x(3,j,i) hp-gm*x(3,j,i)^N2/(x(3,j,i)^N2+k2^N2)*x(4,j,i)];%define f

            if j== 1 || j==2
                x(:,j+1,i)=x(:,1,i)+h/2*f(:,j,i);%first and second approximation of x
            end
            if j== 3
                x(:,j+1,i)=x(:,1,i)+h*f(:,j,i); %third approximation of x
            end
        end
        x(:,1,i+1) = x(:,1,i)+h*(1/6*f(:,1,i)+1/3*f(:,2,i)+1/3*f(:,3,i)+1/6*f(:,4,i));%detirmine x n+1
        t(i+1)=t(i)+h;%update time
    end
    pks = findpeaks(squeeze(x(1,1,:)));%find peaks of x
    mpks = -1*findpeaks(-1*squeeze(x(1,1,:)));
        plot(a(k),pks(round(0.2*length(pks)):length(pks)),'k.',a(k),mpks(round(0.2*length(mpks)):length(mpks)),'k.')%only plot last 50% of points
        title('Bifurcation plot')
        xlabel('a')
        ylabel('cAMP peak values')
        hold on
        drawnow
end