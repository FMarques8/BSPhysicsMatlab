n = 7;
theta = 2*pi/7;
mrot =[cos(theta) -sin(theta); sin(theta) cos(theta)];
l = [2;0];
xa = 5;
ya = 5;
xinicial = xa;
yinicial = ya;
for i = 2:n
    l(:,i)=mrot*l(:,i-1);
    xa = xa+ l(1,i-1);
    ya = ya+l(2,i-1);
    xinicial=[xinicial,xa];
    yinicial=[yinicial,ya];
end
quiver(xinicial,yinicial,l(1,:),l(2,:),0,'b')
hold on
plot(xinicial,yinicial,'ro','lineWidth',2)