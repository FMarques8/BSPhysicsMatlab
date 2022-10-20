%3 rotacao

load dados3;
theta = atan2(y(:,2)-y(:,1),x(:,2)-x(:,1));
theta1=unwrap(theta);

t=transpose(linspace(ti,tf,length(x(:,1)))); %tempo de frame de aquisicao
tint = linspace(t(1),t(end),length(t)*2*n); %tempo interpolacao

yint=interp1(t,theta1,tint,'spline','extrap');

[tmaxmin,ymaxmin,f,sf]=maxmin(tint,yint);

plot(tint,yint,'r',t,theta1,'b',tmaxmin,ymaxmin,'g.','MarkerSize',10);