clear; clc;

% entire z-plane

x=-1:0.01:1; %x

y=-3:0.01:3 ; %y

n=1/2; %n

% our z region

zregion=[];

for j=1:length(x)

for k=1:length(y)

z=x(j)+y(k)*1i;

zregion=[zregion z];

end

end

% mapping

fzRegion=[];

for i=1:length(zregion)

z=zregion(i);

fz=n^z;

fzRegion=[fzRegion fz];

end

% plot these two regions

figure;

subplot(1,2,1);

plot(real(zregion), imag(zregion), 'b.'); zoom on; grid on; hold on;

plot( [-5 5],[0 0 ], '-k', 'LineWidth', 2 );

plot( [0 0],[-5 5 ], '-k', 'LineWidth', 2 );

axis square;

xlabel('x'); ylabel('y');

subplot(1,2,2);

plot(real(fzRegion), imag(fzRegion), 'r.'); zoom on; grid on; hold on;

plot( [-4 4],[0 0 ], '-k', 'LineWidth', 2 );

plot( [0 0],[-4 4 ], '-k', 'LineWidth', 2 );

axis square;

xlabel('u'); ylabel('v'); title('f(z)')