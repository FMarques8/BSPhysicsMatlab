clear all
close all
npontos=10000;
v(:,1)=[0;0];
A1=[0,0;0,0.16]; b1=[0;0];
A2=[0.2,-0.26;0.23,0.22]; b2=[0;1.6];
A3=[-0.15,0.28; 0.26,0.24];b3=[0;0.44];
A4=[0.85,0.04;-0.04, 0.85]; b4=[0;1.6];
pr=[0.01,0.07,0.07,0.85];
for n=1:npontos
    x=rand(1);
    if x<pr(1)
        A=A1; b=b1; caso(n)=1;
    elseif (x<pr(1)+pr(2))
        A=A2; b=b2; caso(n)=2;
    elseif(x<pr(1)+pr(2)+pr(3))
        A=A3;b=b3; caso(n)=3;
    else
        A=A4;b=b4; caso(n)=4;
    end
    v(:,n+1)=A*v(:,n)+b;
    
end
figure(1)
i1=find(caso==1);
plot(v(1,i1),v(2,i1),'k.', 'MarkerSize',1)
hold on
i2=find(caso==2);
plot(v(1,i2),v(2,i2),'r.', 'MarkerSize',1)
i3=find(caso==3);
plot(v(1,i3),v(2,i3),'b.', 'MarkerSize',1)
i4=find(caso==4);
plot(v(1,i4),v(2,i4),'g.', 'MarkerSize',1)
hold off
