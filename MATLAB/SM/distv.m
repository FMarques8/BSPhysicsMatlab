function dy = distv(x,r0,v0,m)
g=9.8;
yp = r0(2)+v0(2)*x-(0.5*(g^2)); %y do projectil
yr=m*x; %y da reta
dy = abs(yr-yp);
end

