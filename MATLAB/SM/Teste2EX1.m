%a)

R = 10;
C=30;
m=0.1;
b=-2;
y=6;

dx=disth(y,m,b,R,C); %calcular dx

%b)

% for y= linspace(-0.5,0.5)
%    dx = disth(y,m,b,R,C);
%    plot(y,dx,'b.');
%    hold on
%    axis equal
% end
% hold off

%c)
xR = linspace(C-R-5,C+5);
yC = linspace(-R,R);
yR = m*xR+b;
xC = C-sqrt(R^2-yC.^2);
plot(xR,yR,'r-')
hold on
axis equal
plot(xC,yC,'b-')
plot(5,0,'.g','MarkerSize',8)
plot(0,5,'.g','MarkerSize',8)

