function []= animacao(r,v,a,b,R,dt,deltat,p)

for i = 0:dt:deltat
    x = r(1) + v(1)*i;
    y = r(2) + v(2)*i;
    plot([0,0,a,a,0],[0,b,b,0,0],"b-")
    hold on;
    plot(x,y,"ro","MarkerSize",28*R)
    axis equal
    axis([-a-2 a+2 -b-2 b+2])
    hold off;
    pause(p)
end
end
