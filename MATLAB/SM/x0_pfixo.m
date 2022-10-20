function x0 = x0_pfixo(c)
x0 = 0.1;

dx=10^-7;
delta = 1;
lambda =0.1;
y1 = x0-tanh((2*x0)/c);
x = x0 - lambda*y1;
y2=x-tanh((2*x)/c);

if abs(y1)<abs(y2)
    lambda = -lambda;
end

while delta>dx
    y1=x-tanh((2*x)/c);
    x = x -lambda*y1;
    delta = abs(y1-lambda*y1);
end
x0 = x;
end

