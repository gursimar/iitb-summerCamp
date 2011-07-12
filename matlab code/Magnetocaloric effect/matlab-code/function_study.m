close all;
clear all;
clc

x = 0 : 0.1:100;
f1 = exp (x);
plot(x,f1)
hold all;
f2 = exp(x).*x.^4;
plot(x,f2)
f3 = exp(x).*x.^4 ./ (exp(x)-1).^2;
plot(x,f3)

title ('Similar to Maxwell-boltzmann distribution');
legend ('e^x','e^x * x^4','(e^x * x^4)/(e^x-1)^2');
ylim([0 5])
xlim([0 15])
