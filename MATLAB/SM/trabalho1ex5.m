r = 2;
T = 7;
v = (2*pi)/T;
teta = linspace(0,2*pi);
x = 1+ r*cos(teta);
y = r*sin(teta);
z = x / cos(teta)
tmax = 10;
dt = 0.3;
for t=0:dt:tmax
    xb = r * cos(v*t)+1;
    yb = r*sin(v*t) ;
    vx =-r*v*sin(v*t);
    vy = r*v*cos(v*t);
    ax = -r*v^2*cos(v*t);
    ay= -r*v^2*sin(v*t);
    plot(xb,yb,'ro',"MarkerFaceColor","r","lineWidth",2)
    hold on
    plot(x,y,"-")
    axis equal
    axis([-3,5,-4,4])
    xlabel('x')
    ylabel('y')
    quiver(xb,yb,vx,vy,0,'y')
    quiver(xb,yb,ax,ay,0,'g')
    drawnow
    pause(0.01)
    hold off
end