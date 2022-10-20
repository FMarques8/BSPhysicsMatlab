N = 1000;
r = rand(2,N);
iverm = find(r(2,:) > 0.5); %indices das matrizes é de cima para baixo da esquerda para a direita
iazul = find(r(2,:) <= 0.5); %find da os indices dos valores pedidos, neste caso, y < 0,5
plot(r(1,iverm),r(2,iverm),'r.')
hold on
plot(r(1,iazul),r(2,iazul),'b.')
MC = [2 0; 0 1/2]; %matriz de compressao
T = repmat([-1;1/2],1,N);% matriz de translacao, repmat -> funçao para repetir a matriz dada entre k e n numeros
nIter = 20;
MCinv = inv(MC); Tinv = [T(2,:);T(1,:)];
for n = 1:nIter;
    plot(r(1,iverm),r(2,iverm),'r.')
    hold on 
    axis equal; axis([0 1 0 1])
    plot(r(1,iazul),r(2,iazul),'b.')
    drawnow
    hold off
    i1 = find(r(1,:) >= 0.5);
    r = MC * r;
    r(:,i1) = r(:,i1) +T(:,i1); 
    pause(0.5)
end
for n = 1:nIter+1
    plot(r(1,iverm),r(2,iverm),'r.')
    hold on
    axis equal; axis([0 1 0 1])
    plot(r(1,iazul),r(2,iazul),'b.')
    drawnow
    hold off
    i2 = find(r(1,:)>= 0.5);
    r = MCinv * r;
    r(:,i2)=r(:,i2)+Tinv(:,i2);
    pause(0.5)
end