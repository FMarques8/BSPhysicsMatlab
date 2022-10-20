%script para obter dados

t1i = 3.3367; %lean back spin/1ª rotacao
t1f=10.1674;

t2i=11.0015; %camel spin/2ª rotacao
t2f=14;

t3i=15.001; %3ª rotacao
t3f=17.0031;

t4i=19.3387; %4ª rotacao
t4f=23.3428;

np=2;
n=5


mv=VideoReader('video1.mp4'); %ler o video para mv
dtframes=n/mv.FrameRate; i=0; t=ti;
while (t <= tf)
    mv.CurrentTime=t;
    mov=readFrame(mv); image(mov);
    t=t+dtframes; i=i+1;
    for ip=1:np
        title(strcat('Frame ',num2str(i),' Ponto ',num2str(ip) ));
        [x(i,ip) ,y(i,ip)]=ginput(1);
    end
end
    
save ('dados4.mat','n','np','ti','tf','x','y');


