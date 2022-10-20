clear all
close all
s0='F++F++F';
n=length(s0);
sF='F-F++F-F';
teta=pi/3;
Mrot=[cos(teta), -sin(teta); sin(teta),cos(teta)];
s=[];
for i=1:n
    if(s0(i) =='F')
        s=[s sF];
    else
        s=[s s0(i)];
    end
end
s0=s;
n=length(s);
s=[];
%fazer desenho
aresta=[1;0];
v=[0;0];
for i=1:n
    if s0(i)=='F'
        novoponto=[]
    end
end