% massa dos corpos-m ; massa da caixa-Mc  
%comprimento do primeiro elastico:xe-xc 
% intensidade da for�a: k(xe-xc-L)
% corpo1:   =-k(xe-xc-L) + k(xd-xe-L)
% corpor2:  =-k(xd-xe-L) + k(xc+3L-xd-L)
% corpo3:   =+k(xe-xc-L) - k(xc+3L-xd-L) - C dxc/dt
clear all
close all
clc

dt=0.1;
t(1)=0;
m=1; %massas dos corpos 1 e 2
L=1;
k=1;
ro=1;
Mc=4;  %massa da caixa
%Aloca��o de mem�ria para o c�digo n�o ficar muito lento
Nsteps=100;
v1(1)=0;
x1(1)=1+0.2;  % eq x1(eq)= 1 
v2(1)=0;
x2(1)=2;  % eq x2(eq)= 2
vc(1)=0;
xc(1)=0;
y=2;

for i=1:Nsteps
    
    %Massa 1 
    v1(i+1) = v1(i) + (dt/m) * (-k*(x1(i)-xc(i)-L) + k*(x2(i)-x1(i)-L));     %xe=x1
    x1(i+1) = x1(i) + dt * v1(i+1);
    
    %Massa 2
    v2(i+1) = v2(i) + (dt/m) * (-k*(x2(i)-x1(i)-L) + k*(xc(i)+2.*L-x2(i)));     %xd=x2
    x2(i+1) = x2(i) + dt * v2(i+1);
    
    %Caixa
    vc(i+1) = vc(i) + (dt/Mc) * (+k*(x1(i)-xc(i)-L)-k*(xc(i)+2.*L-x2(i))- ro*(vc(i))); %dxc/dt=vc(i)   
    xc(i+1) = xc(i) + dt * vc(i+1);

    t(i+1) = t(i)+ dt;
figure(1)
    plot(x2(i), y ,'.r', x1(i), y ,'.b','Markersize',30);
    hold on
    
    %Cria��o dos el�sticos
    e1=line([xc(i) x1(i)], [y y],'Linewidth',1); %une x1
    e2=line([x2(i) x1(i)], [y y],'Linewidth',1);  %une as 2 bolas
    e3=line([x2(i) xc(i)+3.*L], [y y],'Linewidth',1); %une x2
    
    %Cria��o da caixa
    l1=line([xc(i) xc(i)], [0 3], 'Linewidth',1);  %lado direito
    l2=line([xc(i)+3.*L xc(i)+3.*L], [0 3], 'Linewidth',1);   %lado esquerdo 
    %l3=line([xc(i) xc(i)+3.*L], [0 0], 'Linewidth',1);   %linha que une os dois lados
    
    line([-10 10], [0 0],'Linewidth',1)
    axis([-2 4 -1 4])
    hold off
  
    pause(0.05)
    drawnow
end

%-----M�todo de Verlet-----%
clear all
close all

fprintf('Metodo de Verlet\n')
dt=0.1;
t(1)=0;
m=1; %massas dos corpos 1 e 2
L=1;
k=1;
ro=0;
Mc=4;  %massa da caixa
%Aloca��o de mem�ria para o c�digo n�o ficar muito lento
Nsteps=1000;
v1(1)=0;
x1(1)=1+0.2;  % eq x1(eq)= 1 
v2(1)=0;
x2(1)=2;  % eq x2(eq)= 2
vc(1)=0;
xc(1)=0;
y=2;
x1(2)=v1(1)*dt+x1(1);
x2(2)=v2(1)*dt+x2(1);
xc(2)=vc(1)*dt+xc(1);

