file = 'A03_gustavo.txt';
A = readmatrix(file);
A(1,:) = [];
%AA=A(120:616,:);
AA=A;

symbols = AA(:,1);
tmin = AA(:,2);
tavg = AA(:,3);
tmax = AA(:,5);

semilogy(symbols,tmin,'^','Color',[0.9210 0.1450 0.1330])
hold on
semilogy(symbols,tavg,'b')
semilogy(symbols,tmax,'v','Color',[0.1210 0.7450 0.9330])

grid on
xlim([0 520]); ylim([0 6])

xlabel('Symbols');ylabel('Time');title('Computer 2')
legend('T min','T avg','T max')
