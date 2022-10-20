function []= anim (np,R,r,v,a,b,t,dt,p)

while t < 100
    % determinar valores para xx e se tx0 ou txa <0
    % tornar num valor positivo muito grande
    tx0=  (R-r(1))/v(1); %quando bate na parede x=0
    txa = (a-R-r(1))/v(1); % quando bate na parede x = a
    
    if tx0 <= 4*eps
        tx0 = txa + 500;
    end
    
    if txa <= 4*eps
        txa = tx0 + 500;
    end
    % determinar valores para yy e se ty0 ou tya <0
    % tornar num valor positivo muito grande
    ty0 = (R-r(2))/v(2); %quando colide com a parede y = 0
    tyb= (b-R-r(2))/v(2); % quando colide com a parede y = b
    
    if ty0 <= 4*eps
        ty0 = tyb + 500;
    end
    
    if tyb <= 4*eps
        tyb = ty0 + 500;
    end
    
    % deltat_parede
    deltat_parede = [tx0;txa;ty0;tyb];
    
    [deltat,parede] = min(deltat_parede); %primeira parede com que choca
    
    
    for i = 0:dt:deltat
        x = r(1) + v(1)*i;
        y = r(2) + v(2)*i;
        plot([0,0,a,a,0],[0,b,b,0,0],"b-")
        hold on
        axis equal
        axis([-2 a+2 -2 b+2])
        plot(x,y,"ro","MarkerSize",R*28)
        hold off
        pause(p)
    end
    
    %particula na colisao n NAO ESTA A FUNCIONAR
    xcol = r(1) + v(1) * deltat;   %posicao exata do ponto no instante de colisao
    ycol = r(2) + v(2) * deltat;
    plot([0,0,a,a,0],[0,b,b,0,0],"b-")
    hold on
    axis equal
    axis([-2 a+2 -2 b+2])
    plot(xcol,ycol,"ro","MarkerSize",R*28) % 2x o valor pedido para o tamanho da particula para a particula tocar na parede
    hold off
    pause(0.5)
    
    
    %posicao de colisao
    rcol = [xcol;ycol];
    
    
    %definir vetor unitario de acordo com a parede
    if parede == 1
        e = [1;0];
    elseif parede == 2
        e = [-1;0];
    elseif parede == 3
        e = [0;1];
    elseif parede == 4
        e = [0;-1];
    end
    
    vcol = v -2*(dot(v,e))* e; % velocidade apos a colisao
    
    %voltar a determinar instantes para a 2a colisao
    tx02=  (R-rcol(1))/vcol(1); %quando bate na parede x=0
    txa2 = (a-R-rcol(1))/vcol(1); % quando bate na parede x = a
    
    if tx02 <= 4*eps
        tx02 = txa2 + 500;
    end
    
    if txa2 <= 4*eps
        txa2 = tx02 + 500;
    end
    % determinar valores para yy e se ty0 ou tya <0
    % tornar num valor positivo muito grande
    ty02 = (R-rcol(2))/vcol(2); %quando colide com a parede y = 0
    tyb2= (b-R-rcol(2))/vcol(2); % quando colide com a parede y = b
    
    if ty02 <= 4*eps
        ty02 = tyb2 + 500;
    end
    
    if tyb2 <= 4*eps
        tyb2 = ty02 + 500;
    end
    
    % deltat_parede
    deltat_parede2 = [tx02;txa2;ty02;tyb2];
    
    [deltat2,parede2] = min(deltat_parede2); %primeira parede com que choca
    
    for j = 0:dt:deltat2
        xf = rcol(1) + vcol(1)*j;
        yf = rcol(2) + vcol(2)*j;
        plot([0,0,a,a,0],[0,b,b,0,0],"b-")
        hold on
        axis equal
        axis([-2 a+2 -2 b+2])
        plot(xf,yf,"ro","MarkerSize",R*28)
        hold off
        pause(p)
    end
    
    %posiçao exata para a colisao n+1 NAO ESTA A FUNCIONAR
    xf = rcol(1) + vcol(1) * deltat2;   %posicao exata do ponto no instante de colisao
    yf = rcol(2) + vcol(2) * deltat2;
    plot([0,0,a,a,0],[0,b,b,0,0],"b-")
    hold on
    axis equal
    axis([-2 a+2 -2 b+2])
    plot(xf,yf,"ro","MarkerSize",R*28) % 2x o valor pedido para o tamanho da particula para a particula tocar na parede
    hold off
    pause(p)
    
    %definir vetor unitario de acordo com a parede
    if parede2 == 1
        e2 = [1;0];
    elseif parede2 == 2
        e2 = [-1;0];
    elseif parede2 == 3
        e2 = [0;1];
    elseif parede2 == 4
        e2 = [0;-1];
    end
    
    v = vcol -2*(dot(vcol,e2))* e2;
    %tornar os vetores pre colisao iguais a
    %apos colisao para a proxima iteracao
    r = [xf;yf];
    t = tt + (deltat + deltat2);
end
end

