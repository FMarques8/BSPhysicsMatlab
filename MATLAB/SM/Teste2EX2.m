%a(
c = 3;
x0 = x0_pfixo(c)

%b)

for c =linspace(0,10,20)
    x0 = x0_pfixo(c);
    plot(c,x0,'.b','MarkerSize',5)
    hold on
    axis equal
end