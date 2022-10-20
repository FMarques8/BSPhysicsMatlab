
%funcao para calcular deltat minimos para colisoes com outras bolas
function [deltat,bola]=minbola(deltat_bola,np)
    deltat=9999999;
    bola = 0;
    for i=1:1:np
        if deltat_bola(i)<deltat 
            if deltat_bola(i) >= 4*eps
                deltat = deltat_bola(i);
                bola = i;
            end
        end
    end    
end

