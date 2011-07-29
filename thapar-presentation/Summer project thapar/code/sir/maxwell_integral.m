clc
hold off;

x = 0:0.1:8
f = 1-(exp(1./x).*((1./x)+1));
plot(x,f)
hold all;
f2 = exp(-x).*x
plot(x,f2)

for n=1:80
    f3 = quad (@(y) exp(-y).*y,0,x(n))
end

%plot(x,f3,'.-');

ylim ([-25 3 ])
plot(x,0)
