r0=[0;2];
v0=[10;10];
m=0.1;

for x=0:0.5:30
    dy = distv(x,r0,v0,m);
    plot(x,dy,'r.')
    hold on
    axis equal
    axis([-0.5 30.5 0 260])
    drawnow
end