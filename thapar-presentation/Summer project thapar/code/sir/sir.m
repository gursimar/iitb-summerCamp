close all;
clear all;
clc

gama = 20 * 1e-3;
N = 6 * 1e23;
thetad = 350;
R = 8.314;

T = 0:0.1:100;
f = @(x) ((x.^4) .* exp(x)) ./((exp(x)-1).^2);

C1 = linspace (0,0,length(T));
C2 = linspace (0,0,length(T));
C3 = linspace (0,0,length(T));

figure
title('Integral part of the equation \int {x^4e^x}/{(e^x-1)^2}dx')
%legend('',);

subplot(2,2,1)

C1 = f(T);
plot(T,C1);
xlim ([0 20]);
ylim ([0 10]);
title ('{x^4e^x}/{(e^x-1)^2}');
ylabel('Function value');
xlabel ('X axis');

for n=1:length(T)
    C2(n) = quad(f,0,thetad/T(n));
    C3(n) = quad(f,0,T(n));
    C4(n) = gama*T(n) + 9*N*R*((T(n)/thetad)^3)*quad(f,0,thetad/T(n));
    
end

subplot(2,2,2)
plot(T,C2);
title('\int {x^4e^x}/{(e^x-1)^2}dx')
ylabel('Function value');
xlabel ('X axis');

subplot(2,2,3)
plot(T,C3);
title('\int {x^4e^x}/{(e^x-1)^2}dx')
ylabel('Function value')
xlabel ('X axis');


subplot(2,2,4)
plot (T,C4);
title('Full equation');
ylabel('Specific heat capacity (C)');
xlabel ('Temperature (T)');

