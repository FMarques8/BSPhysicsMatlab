%2 rotacao

load dados2;
dx=x(:,1)-x(:,2);

t=transpose(linspace(ti,tf,length(x(:,1)))); %tempo de frame de aquisicao
tint = linspace(t(1),t(end),length(t)*2*n); %tempo interpolacao

yint=interp1(t,dx,tint,'spline','extrap');

[tmaxmin,ymaxmin,f,sf]=maxmin(tint,yint);

plot(tint,yint,'r',t,dx,'b',tmaxmin,ymaxmin,'g.','MarkerSize',10);