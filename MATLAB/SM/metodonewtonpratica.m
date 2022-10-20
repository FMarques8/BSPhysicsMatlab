%metodo newton aula pratica
close all
x0 = 0.5;
y0= 10;
v0x = 0;
v0y=0;
g = 9.8;
lambda = 0.01;
ti=0;
t0=0.7; %estimativa
prec=1e-10; % precisao
alfa = 2; %[1,5];
nc = 200;
tf = newton(t0,prec,x0,y0,v0x,v0y,alfa,g);  %determinar tf (tempo de colisao)
for i=1:nc
    dt = tf/20;
    for t=ti:dt:tf
        x = x0+v0xt;
        y = y0+v0y*t-0.5*g*(t^2);
        vx=v0x;
        vy=v0y-gt;
        superf(alfa,x,y)
    end
    grad=[2.*alfa.*x-4.*x^3.1];  %vetor perpendicular a derivada slope do grafico em x
    grad = grad/norm(grad);  %versor
    hold on
    quiver(x,y,grad(1),grad(2),0,"b");
    v = [vx;vy];
    nv = norm(v);
    quiver(x,y,vx/nv,vy/nv,0,"r");
    vn=gradv;  %componente segundo a normal
    vp=[grad(2),-grad(1)]*v; %tangente
    vn=-vn; %reflexao
    v=vngrad'+vp*[grad(2);-grad(1)]; %nova velocidade apos reflexao
    vx = v(1);
    vy = v(2);
    nv = norm(v);
    quiver(x,y,vx/nv,vy/nv,0,"k")
    hold off
    pause(0.5)
    %novas variaveis
    x0 = x;
    y0 = y;
    v0x = vx;
    v0y = vy;
    tf = pg(0,0.01,x0,y0,v0x,v0y,alfa,g);
    tf = newton(tf,prec,x0,y0,v0x,v0y,alfa,g);
end
function superf(alfa,x,y)  %animacao
xs = -2:0.01:2;
ys=-alfaxs.^2+xs.^4+6; %funcao
figure(1)
plot(xs,ys,'b-',x,y,'ro')
axis([min(xs), max(xs), min(ys)-0.2max(ys), max(ys)])
axis off
axis square
drawnow
hold on
end
function tn=newton(tn, prec,x0,y0,v0x,v0y,alfa,g)
dy=10000; der=1;
ni=0;
while(abs(dy)>prec && ni<10000)
    ni=ni+1;
    [dy,der]=dist(x0,y0,v0x,v0y,alfa,tn,g);
    tn=tn-dy/der;
end
end
function [dy,der] = dist(x0,y0,v0x,v0y,alfa,t,g)
x=v0xt+x0; %x
dy = y0 +v0yt-0.5gt^2+alfax^2-x^4-6; %queda do ponto "ro"
der=v0y-gt+2alfaxv0x-4x^3*v0x; %derivada de dy onde x(t)
end
function t=pg(t0, prec,x0,y0,v0x,v0y,alfa,g) %calcular o tempo q demora a passar com prec a mais
t=t0+prec;
d=dist(x0,y0,v0x,v0y,alfa,t,g);
while d>0
    t=t+prec;
    d=dist(x0,y0,v0x,v0y,alfa,t,g);
end
end