
%calcular deltat min para colisoes com paredes
function [deltat,parede]=minparede(deltat_parede)
    deltat=9999999;
    parede = 0;
    for i=1:1:4
        if deltat_parede(i)<deltat 
            if deltat_parede(i) >= 4*eps
                deltat = deltat_parede(i);
                parede = i;
            end
        end
    end    
end

