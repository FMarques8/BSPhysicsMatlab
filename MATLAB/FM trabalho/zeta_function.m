y=-5:0.01:5;

x=-4.9:0.1:5;

zregion=[];

for j=1:length(x)

for k=1:length(y)

z=x(j)+y(k)*1i;

zregion=[zregion z];

end

end

figure;

%input
subplot(1,2,1)
hold on;
grid on;
fill([-5,5,5,-5,-5],[-5,-5,5,5,-5],'r')
xlim([-7 7]);ylim([-7 7])
xlabel('x'); ylabel('y'); title('Input');


%zeta function
subplot(1,2,2)
plot(zeta(zregion),'b')
grid on
xlim([-10 10]);ylim([-5 5]);
xlabel('Re');ylabel('Im');title('Zeta Function');
