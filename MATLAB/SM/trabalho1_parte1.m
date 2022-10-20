
%dados
np = 15;
a = 20; %lados do recipiente
b = 10;
R = 0.5; % raios do circulo gerados aleatoriamente entre 0 e 1
[r,erro] = posicoes_iniciais(a,b,R,np);
v = randn(2,np); % velocidade aleatoria (distribuiçao gausseana para todas as situaçoes
dt = 0.1; %intervalo entre plots
tmax = 100;
p = (0.1); %tempo de pausa por conveniencia (SO USADO NA FUNCAO ANIMACAO!!!)
deltat = 10; % tambem so usado na funcao animacao

%invocar funcao animacao
animacao(r(:,1),v(:,1),a,b,R,dt,deltat,p) 


%invocar funcao das colisoes de uma particula
%colisoes_parede(np,R,r,v,a,b,tmax,dt)

%invocar funcao da colisoes de n particulas
%colisoes_particulas(np,R,r,v,a,b,tmax,dt)
