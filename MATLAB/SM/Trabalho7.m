%Trabalho 7

clear all
close all
clc
% posçãoo inicial da bola
x0=0.5; y0=10; v0x=0; v0y=0; g=9.8;

%superficie
alfa=2; %entre 1 e 5

ti=0; t0=0.7; prec=1e-10; lambda=0.01;
%numero de colisoes
nc=200;
%deteminar instante de colisão
tf=pfixo(lambda,t0, prec,x0,y0,v0x,v0y,alfa,g);

dt=tf/20;
for t=ti:dt:tf
x=v0x*t+x0; y=y0+v0y*t-0.5*g*t^2;
vx=v0x; vy=v0y-g*t;
superf(alfa,x,y);
end


function tn=pfixo(lambda,t0, prec,x0,y0,v0x,v0y,alfa,g)
[dy1,der]=dist(x0,y0,v0x,v0y,alfa,t0,g);
tn=t0-lambda*dy1;
[dy2,der]=dist(x0,y0,v0x,v0y,alfa,tn,g);

dy=dy2; 
if (abs(dy1)< abs(dy2))
    lambda=-lambda;
    dy=dy1; tn=t0;
 end

ni=0;
while(abs(lambda*dy)>prec && ni<100000)
ni=ni+1;
[dy,der]=dist(x0,y0,v0x,v0y,alfa,tn,g);
tn=tn-lambda*dy;

end

end

function t=pesquisa_grosseira(t0, prec,x0,y0,v0x,v0y,alfa,g)
t=t0+prec;
d=dist(x0,y0,v0x,v0y,alfa,t,g);
 while d>0
     t=t+prec;
     d=dist(x0,y0,v0x,v0y,alfa,t,g);
 end

end

function [dy,der]=dist(x0,y0,v0x,v0y,alfa,t,g)
x=v0x*t+x0;
dy=y0+v0y*t-0.5*g*t^2+alfa*x^2 -x^4-6;
der=v0y-g*t+2*alfa*x*v0x-4*x^3*v0x;
end
