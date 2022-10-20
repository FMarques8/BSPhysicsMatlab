function animacao3(r,v,a,b,R,dt,tmax,np)
dt_parede = zeros(np,4);
teta = 0:pi/100:2*pi;
xf = zeros(1,np);
yf = zeros(1,np);
rf = [xf;yf];
vf = zeros(2,np);
dt1 = zeros(1,np);
parede = zeros(1,np);
tp=zeros(1,np);
deltatij= zeros(np,np);
xij = zeros(np,np);
yij = zeros(np,np);
vxij = zeros(np,np);
vyij = zeros(np,np);
bola2 = zeros(1,np);
mindeltatij = zeros(1,np);
for t=0:dt:tmax
    for p=1:np
        for j=1:np
            i=p;
            ri=r(:,i);
            rj=r(:,j);
            xij(i,j)= ri(1)-rj(1);
            yij(i,j) = ri(2)-rj(2);
            rij=[xij(i,j);yij(i,j)];
            vi=v(:,i);
            vj=v(:,j);
            vxij(i,j)=vi(1)-vj(1);
            vyij(i,j) = vi(2)-vj(2);
            vij=[vxij(i,j);vyij(i,j)];
            a1  = norm(vij)^2;
            b1 = 2*(dot(rij,vij));
            c1 = norm(rij)^2 - 4*R^2;
            if b1<-4*eps && b1^2-4*a1*c1>4*eps 
                deltatij(i,j) = (-b1-sqrt(b1^2-4*a1*c1))/(2*a1);
            end
        end
        [mindeltatij(p),bola2(p)] = min3(deltatij(p,:),np);
        
        rp = r(:,p);
        vp = v(:,p);
        dx0 = (R-rp(1))/vp(1); %parede1 x=0
        da = (a-R-rp(1))/vp(1); % parede2 x=a 
        dy0 = (R-rp(2))/vp(2); %parede3 y=0
        db = (b-R-rp(2))/vp(2); %parede4 y=b
        dt_parede(p,:) = [dx0,da,dy0,db];
        [dt1(p),parede(p)] = min1(dt_parede(p,:));
        if dt1(p) < mindeltatij(p)
            xf = rp(1)+vp(1)*dt1(p); %posicao (final) de bater na parede 
            yf = rp(2)+vp(2)*dt1(p);
            rf(:,p) = [xf;yf];
            if parede(p) == 1
                e = [1;0];
            elseif parede(p) == 2
                e = [-1;0];
            elseif parede(p) == 3
                e = [0;1];
            else
                e = [0;-1];
            end
            vf(:,p) = v(:,p)-2*(dot(v(:,p),e))*e;
            if t>= tp(p)+dt1(p)
                tp(p) = tp(p)+dt1(p);
                r(:,p) = rf(:,p);
                v(:,p) = vf(:,p);
            end
        elseif dt1(p) > mindeltatij(p)
            i = p;
            j = bola2(p);
            rp = r(:,i);
            vp = v(:,i);
            rbola2 = r(:,j);
            vbola2 = v(:,j);
            xf = rp(1)+vp(1)*mindeltatij(i); %posicao (final) de bater na parede 
            yf = rp(2)+vp(2)*mindeltatij(i);
            xf2 = rbola2(1)+vbola2(1)*mindeltatij(j); %posicao (final) de bater na parede 
            yf2 = rbola2(2)+vbola2(2)*mindeltatij(j);
            if t>= tp(i)+ mindeltatij(i)
                tp(i) = tp(i)+mindeltatij(i);
                tp(j) = tp(j)+mindeltatij(j);
                r(:,i) = [xf;yf];
                r(:,j) = [xf2;yf2];
                v2 = v(:,i);
                v(:,i) = v(:,j);
                v(:,j) = v2;
            end
        end
        rp = r(:,p);
        vp = v(:,p);
        x = rp(1)+vp(1)*(t-tp(p));
        y = rp(2)+vp(2)*(t-tp(p));
        plot([0,a,a,0,0],[0,0,b,b,0],"-r")
        hold on
        plot(x+R*cos(teta),y+R*sin(teta),"-b")
        hold on
        axis([-1,a+1,-1,b+1]) 
    end
    hold off
    pause(dt)
end