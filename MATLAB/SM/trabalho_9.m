%trabalho nº9

%Introduçao  1
%passo 1
x=1:19;
lambda=5;
y=exp(x/lambda);
plot(x,y,'ro');

%passo 2
x2=linspace(-5,30,100);
y2 = interp1(x,y,x2,'linear','extrap'); %interpolaçao linear

y3= interp1(x,y,x2,'cubic','extrap'); %interpolaçao cubica
y4=interp1(x,y,x2,'spline','extrap');

yv=exp(x2/lambda);%y verdadeiro

plot(x,y,'ro',x2,y2,'b-',x2,y3,'k-',x2,y4,'g-',x2,yv,'o');

%introduçao 2

%passo 1
a = polyfit(x2,yv,3);%2 é o grau do polinomio, ou seja, x^2+x+k, se fosse 3 seria x^3+x^2+x+k....
yr =a(1)*(x2.^3)+a(2)*(x2.^2)+a(3)*x2+a(4);
plot(x2,yv,'ro',x2,yr,'k-')

%mesma forma de fazer, mas sem ser preciso escrever a expressao
yr2 = polyval(a,x2);
plot(x2,yv,'ro',x2,yr2,'k-');

%parte 2

%passo 1

clear all
close all
load dados
mv=VideoReader('slow motion back flip.wmv'); %ler o video para mv
%mv=VideoReader('slow_motion.mp4'); %ler o video para mv

mov=readFrame(mv); %ler o primeiro frame 
figure(1)
image(mov);

% medimos a altura do rapaz em pixeis
% 
%[x1, y1]=ginput(2); hpixeis=abs(y1(1)-y1(2)); pix_metro=1.75/hpixeis; %
%  assumindo uma altura de 1.75m

nframes=int32(mv.Duration*mv.FrameRate); %numero de frames no video
ti=28; tf=35; % fixar os instantes iniciais e finais de interesse
framei=ti*mv.FrameRate; framef=tf*mv.FrameRate; %frames iniciais e finais
mv.CurrentTime=ti; % salta para tempo ti
n=10; % ler frames de n em n
dtframes=n/mv.FrameRate; % tempo entre frames a ler
nf=(framef-framei)/n; % numero de frames a ler


for i=1:nf
    mov=readFrame(mv);     image(mov); %representa imagem
    mv.CurrentTime=mv.CurrentTime+dtframes; % posiciona no frame a ler
    %ler pontos do centro de massa do rapaz em cada frame
    %title(strcat('Frame',num2str(i),' Ponto ',num2str(i))); [xcm(i) ycm(i)]=ginput(1);
end
pause(3)
%save dados

figure(1)
t=1:nf;
%t=1:nf+1;
h=(360-ycm)*pix_metro; % altura do CM em metros
a=polyfit(t,h,2);
yr=a(3)+a(2)*t+a(1)*t.^2;
%yr2=polyval(a,t);
plot(t,h,'rx',t,yr,'k-')
xlabel('frame') ;ylabel ('altura (pixeis)')

%intervalo de tempo entre frames para obter g=9.8 m/s^2
dtreal=sqrt(-2*a(1)/9.8);% -dt^2 / *g =a(1)
% este e o dtreal entre frames no video original espaçados de n frames
% No video original cada frames esta espaçado de dtreal/n
dtreal=dtreal/n;
% o filme foi filmado a 
RateReal=1/dtreal; % mas está a ser reproduzido a 30 frames/s
fprintf(1,' A Rate Frame de Filmagem foi %f e a FrameRate de reprodução do video é %f\n',RateReal, mv.FrameRate);
pause(3)

hf=figure(2);
mv.CurrentTime=ti; % salta para tempo ti
for i=1:nf
    mov=readFrame(mv);     image(mov); %representa imagem
    hold on
    title(strcat('Frame ',num2str(1+(i-1)*n),' Ponto ',num2str(i)));
    plot(xcm(i),ycm(i),'ro','MarkerSize',10,'MarkerFaceColor',[1,0,0])      
    hold off
    drawnow
    mv.CurrentTime=mv.CurrentTime+dtframes; % posiciona no frame a ler
    F(i)=getframe(hf);
end

% reproducao em tempo real
hf=figure(3);
framerate=RateReal/n;
movie(hf,F,1,framerate); % para reproduzir em tempo real
pause(3)

%aquisição de pontos  para a velocidade angular
figure(4)
mv.CurrentTime=ti; % salta para tempo ti
n=10; % ler frames de n em n
dtframes=n/mv.FrameRate; % tempo entre frames a ler
nf=(framef-framei)/n; % numero de frames a ler
for i=1:nf
    mov=readFrame(mv);     image(mov); %representa imagem
    mv.CurrentTime=mv.CurrentTime+dtframes; % posiciona no frame a ler
    %ler pontos do centro de massa do rapaz em cada frame
%     title(strcat('Frame',num2str(i),' Ponto  ',num2str(i)));
%      for ip=1:4
%      [x2(i,ip) ,y2(i,ip)]=ginput(1); %ler 4 pontos pes, joelhos, bacia, cabeca
%      end
end
%save dados 
pause(5)
hf=figure(5);
mv.CurrentTime=ti; % salta para tempo ti
for i=1:nf
    mov=readFrame(mv);     image(mov); %representa imagem
    hold on
    title(strcat('Frame ',num2str(1+(i-1)*n),' Ponto  ',num2str(i)));
    plot(x2(i,:),y2(i,:),'r-','LineWidth',2,'Color',[1,0,0])  %tudo
    %plot(x2(i,3:4),y2(i,3:4),'r-','LineWidth',2,'Color',[1,0,0]) %bacia-cabeça
    hold off
    drawnow
    mv.CurrentTime=mv.CurrentTime+dtframes; % posiciona no frame a ler
    pause
end

pause(5)

figure (6)
teta=atan2(360-y2(:,4)-(360-y2(:,3)),x2(:,4)-x2(:,3));
 teta(teta<0)=teta(teta<0)+2*pi;
 teta(end)=teta(end)+2*pi;
 ang=teta*180/pi
%t=(1:nf)*dtreal; %orig
t=(1:nf+1)*dtreal;%modif jesus
xpol=linspace(t(1),t(end),200);
ypol=interp1(t,teta,xpol,'spline','extrap');
plot( t, teta,'o',xpol,ypol,'r-')

xlabel ('t'); ylabel('teta')
pause(5)

figure(7)
w=diff(ypol)./diff(xpol);
plot(xpol(2:end),w,'k-',t,360-ycm,'x')
ylabel('w'); xlabel('t')
text(0.01,190,'Pernas e maos junto ao tronco perto da altura máxima')

