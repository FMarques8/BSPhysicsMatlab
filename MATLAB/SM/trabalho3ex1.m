n = 5;
theta = (2*pi)/5;
mrot = [ cos(theta) -sin(theta); sin(theta) cos(theta)];
v = zeros(2,n);
v(:,1) = [1;0];
rot = pi/6;
mr = [cos(rot) -sin(rot); sin(rot) cos(rot)];
for i = 2:n
    v(:,i)= mrot*v(:,i-1);
end
plot(v(1,:),v(2,:),'ro')
vp = [v v(:,1)];
hold on 
plot(vp(1,:),vp(2,:),'-g')
plot(0,0,'xb')
fi = pi/4;
r = 3;
t = ones(2,n);
t(1,:)=v(1,:)+(r*cos(fi));
t(2,:) = v(2,:)+(r*sin(fi));
t = mr * t;
tp = [t t(:,1)];
for i = 2:n
plot(t(1,:),t(2,:),'ro')
plot(tp(1,:),tp(2,:),'g-')
x = r*cos(fi);
y = r*sin(fi);
plot(x,y,'xb')
r = r+3;
t(1,:)=v(1,:)+(r*cos(fi));
t(2,:) =v(2,:)+(r*sin(fi));
t = mr*t;
tp = [t t(:,1)];
end