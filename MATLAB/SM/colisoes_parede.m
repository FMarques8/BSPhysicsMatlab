%backup funcao
%funçao final das colisoes
function []= colisoes_parede (np,R,r,v,a,b,tmax,dt)
deltat_parede = zeros(4,np);
xf = zeros(1,np);
yf = zeros(1,np);
rf = [xf;yf];
vf = zeros(2,np);
deltat = zeros(1,np);
parede = zeros(1,np);
tp = zeros(1,np);

for t=0:dt:tmax
    for n = 1:1:np
        rp = r(:,n);
        vp = v(:,n);
        
        tx0 = (R-rp(1))/vp(1); %parede1 x=0
        ta = (a-R-rp(1))/vp(1); % parede2 x=a
        if tx0 <= 4*eps
            tx0 = 9999999;
        end
        if ta <= 4*eps
            ta = 9999999;
        end
        
        ty0 = (R-rp(2))/vp(2); %quando colide com a parede y = 0
        tb= (b-R-rp(2))/vp(2);
        if ty0 <= 4*eps
            ty0 = 99999999;
        end
        if tb <= 4*eps
            tb = 9999999;
        end
        
        deltat_parede(:,n) = [tx0;ta;ty0;tb];
        [deltat(n),parede(n)] = min(deltat_parede(:,n)); %primeira parede com que choca
        
        xf = r(1,n) + v(1,n)*deltat;
        yf = r(2,n) + v(2,n)*deltat;
        rf = [xf;yf];
        
        if parede(n) == 1
            e = [1;0];
        elseif parede(n) == 2
            e = [-1;0];
        elseif parede(n) == 3
            e = [0;1];
        elseif parede(n) == 4
            e = [0;-1];
        end
        
        vf(:,n) = v(:,n)-2*(dot(v(:,n),e))*e;
        
        if t>= tp(n)+deltat(n)
            tp(n) = tp(n)+deltat(n);
            r(:,n) = rf(:,n);
            v(:,n) = vf(:,n);
        end
        
        rp = r(:,n);
        vp = v(:,n);
        x = rp(1)+vp(1)*(t-tp(n));
        y = rp(2)+vp(2)*(t-tp(n));
        plot([0,0,a,a,0],[0,b,b,0,0],"b-")
        hold on
        plot(x,y,"ro","MarkerSize",R*28)
        hold on
        axis equal
        axis([-2 a+2 -2 b+2])
    end
    hold off
    pause(dt)
end
end