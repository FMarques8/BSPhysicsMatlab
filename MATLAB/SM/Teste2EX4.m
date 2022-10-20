%a)

b = 1; %kg/s
m = 1; %kg
g=9.8; %m/s2

x=zeros(1,2);
v = zeros(1,2);

t=1;
dt = 0.1;
%posicao

x(t)=100*m;
%velocidade

v(t) = 0;
v(t+1) = v(t)-((b/m)*x(t)-g)*dt

x(t+1) = x(t+1)+v(t)


% a = -(b/m)*x-g
% v(t+dt)-v(t)=(-(b/m)*x-g)*dt
% v(t+dt) = v(t) -(((b/m)*x-g)*dt
% 
% x(t+dt) = x(t)+v(t+dt)*dt
% x(t+dt) = x(t) + v(t)-((b/m)*x-g)*dt^2
i=1;
while x(t)>0
   v(t+1) = v(t)-((b/m)*x(t)-g)*dt
   x(t+1) = x(t)+v(t+1)*dt
   
   
   
   
   t(i+1)=t(i)+1;
   i=i+1;
end

%b)
plot(t,x,'r.')
    
