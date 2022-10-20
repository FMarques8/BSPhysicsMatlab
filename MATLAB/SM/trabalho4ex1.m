n = 4;
c = 2
k = sin(0.4);
theta = 2*pi/n; % angulo do poligono
phi = pi/10; %angulo de rotaçao
M = [cos(phi) -sin(phi);sin(phi) cos(phi)]; %matriz de rotaçao do poligono
T = ones(2,n+1); %matriz de translaçao xy
T(1,:) = T(1,:) * 4; %matriz de tranlaçao xx
T(2,:) = T(2,:) * 2; %matriz de translaçao yy
mrot = [cos(theta),-sin(theta); sin(theta),cos(theta)]; % matriz rotaçao dos pontos do poligono (formar poligonos com n lados)
v = [1;1];
for i = 1 : n
    v(:,i+1) = mrot * v(:,i);
end
plot(v(1,:),v(2,:),'r.')
hold on
axis equal
axis([-5 30 -5 30])
vp = [v v(:,1)];
plot(vp(1,:),vp(2,:),'-b')
u = M * v +T;
plot(u(1,:),u(2,:),'r.')
up = [u u(:,1)];
plot(up(1,:),up(2,:),'-b')
AR = [c 0;0 1/c]; %matriz de stretch e squeeze (1/k)
p = AR * v -1;
plot(p(1,:),p(2,:),'.g')
pp = [p p(:,1)];
plot(pp(1,:),pp(2,:),'y')
DIS = [1 k;0 1]; %distoçao xx (para yy [1 0;k 1]
b = DIS * v
e = abs(b-v);
b = DIS*v +e;
plot(b(1,:),b(2,:),'b.')
bp = [b b(:,1)];
plot(bp(1,:),bp(2,:),'r');

