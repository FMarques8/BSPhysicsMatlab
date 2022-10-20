
%funçao final das colisoes
function []= colisoes_particulas (np,R,r,v,a,b,tmax,dt)
deltat_parede = zeros(np,4);
xf = zeros(1,np);
yf = zeros(1,np);
rf = [xf;yf];
vf = zeros(2,np);
deltat = zeros(1,np);
parede = zeros(1,np);
tp = zeros(1,np);

%tempos relativos entre particulas(colisao entre particulas)
deltatij = zeros(np,np);
xij = zeros(np,np);
yij = zeros(np,np);
vxij = zeros(np,np);
vyij = zeros(np,np);
bola = zeros(1,np);
mindeltatij = zeros(1,np);

for t=0:dt:tmax
    for n = 1:1:np
        for j = 1:1:np
            i = n;
            ri = r(:,i);
            rj = r(:,j);
            vi = v(:,i);
            vj = v(:,j);
            xij(i,j) = ri(1)-rj(1);
            yij(i,j) = ri(2)-rj(2);
            rij = [xij(i,j);yij(i,j)];
            vxij(i,j) = vi(1)-vj(1);
            vyij(i,j) = vi(2)-vj(2);
            vij = [vxij(i,j);vyij(i,j)];
            
            aa  = norm(vij)^2;
            bb = 2*(dot(rij,vij));
            cc = norm(rij)^2 - 4*R^2;
            
            if (bb < -4*eps) && ((bb^2)-(4*aa*cc) > 4*eps)
                deltatij(i,j) = (-bb-sqrt((bb^2)-(4*aa*cc)))/(2*aa);
            end
        end
        [mindeltatij(n),bola(n)] = minbola(deltatij(n,:),np);
        
        
        %colisao parede
        rp = r(:,n);
        vp = v(:,n);
        tx0 = (R-rp(1))/vp(1); %parede1 x=0
        ta = (a-R-rp(1))/vp(1); % parede2 x=a
        ty0 = (R-rp(2))/vp(2); %parede3 y=0
        tb = (b-R-rp(2))/vp(2); %parede4 y=b
        deltat_parede(n,:) = [tx0,ta,ty0,tb];
        [deltat(n),parede(n)] = minparede(deltat_parede(n,:));
        
        %decidir se colide com parede ou outra bola
        if deltat(n) < mindeltatij(n)
            xf = rp(1)+vp(1)*deltat(n); %posicao (final) de bater na parede
            yf = rp(2)+vp(2)*deltat(n);
            rf(:,n) = [xf;yf];
            if parede(n) == 1
                e = [1;0];
            elseif parede(n) == 2
                e = [-1;0];
            elseif parede(n) == 3
                e = [0;1];
            else
                e = [0;-1];
            end
            vf(:,i) = v(:,i)-2*(dot(v(:,i),e))*e;
            if t>= tp(i)+deltat(i)
                tp(i) = tp(i)+deltat(i);
                r(:,i) = rf(:,i);
                v(:,i) = vf(:,i);
            end
        elseif mindeltatij(n) < deltat(n)
            j = bola(i);
            rp = r(:,i);
            vp = v(:,i);
            rbola = r(:,j);
            vbola = v(:,j);
            xf = rp(1)+vp(1)*mindeltatij(i);
            yf = rp(2)+vp(2)*mindeltatij(i);
            xf2 = rbola(1)+vbola(1)*mindeltatij(j);
            yf2 = rbola(2)+vbola(2)*mindeltatij(j);
            
            if t>= tp(i)+ mindeltatij(i)
                tp(i) = tp(i)+mindeltatij(i);
                tp(j) = tp(j)+mindeltatij(j);
                r(:,i) = [xf;yf];
                r(:,j) = [xf2;yf2];
                vbola = v(:,i);
                v(:,i) = v(:,j);
                v(:,j) = vbola;
            end
        end
        
        rp = r(:,i);
        vp = v(:,i);
        x = rp(1)+vp(1)*(t-tp(i));
        y = rp(2)+vp(2)*(t-tp(i));
        plot([0,a,a,0,0],[0,0,b,b,0],"-b")
        hold on
        plot(x,y,"ro","MarkerSize",28*R)
        hold on
        axis([-1,a+2,-1,b+2])
        
    end
    hold off
    pause(dt)
end
end
