function dx = disth(y,m,b,R,C)
yc=y;
yr=y;
xc=C-sqrt(R^2-yc.^2);
xr=(yr-b)/m;
dx=xr-xc;
end

