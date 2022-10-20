

filename ='98533_50tasks'; %98533
fl2 = '97639_50tasks';%97639
A = readmatrix(filename);
B = readmatrix(fl2);
x=A(:,1);
x2=B(:,1);
y=A(:,2);
y2=B(:,2);

yaveg = ones(45,1);
xaveg2 = ones(45,1);
xaveg = ones(45,1);
yaveg2= ones(45,1);
%fazer media dos y em x repetidos
for i = 1:1:45
    xk = find(x==i);
    xz = find(x2==i);
    xaveg(i) = mean(x(xk));
    xaveg2(i) = mean(x(xz)); 
    yaveg(i) = mean(y(xk));
    yaveg2(i)=mean(y(xz));
end

for i = 46:1:50
    h = find(x==i);
    z = find(x2==i);
    x(h)=[];
    x2(z)=[];
    y(h) =[];
    y2(z)=[];
end

c = find(yaveg < 0.000000001);
d = find(yaveg2 < 0.000000001);
ypre = yaveg;
y2pre = yaveg2;
ypre(c)=0.000000001;
y2pre(d)=0.000000001;

semilogy(x,y,'*r')
hold on
semilogy(x2,y2,'ob')

p = polyfit(xaveg,ypre,1);
yfit = polyval(p,xaveg);
ylog = exp(yfit);

p2 = polyfit(xaveg2,y2pre,1);
yfit2 = polyval(p2,xaveg2);
ylog2=exp(yfit2);


plot(xaveg,ylog,'--r','LineWidth',2)

plot(xaveg2,ylog2,'-b')

title ('Computador 1; P = 10', 'FontSize',14)
xlabel ('Tasks', 'FontSize',10)
ylabel ('Time (s)', 'FontSize',10)
grid on





