clear all
close all
nmax=1000;

R=2;
x01=0,5;
x02=0.4999;
x(1)=x0;
for n=1:nmax
    x1(n+1)=f(x1(n),R);
    x2(n+1)=f(x2(n),R);
end
np=100;
%representar os ultimos np pontos
figure(1)
plot(1:nmax,x1(1:nmax),'k-')
hold on
plot