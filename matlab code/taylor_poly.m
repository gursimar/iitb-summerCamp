% This script illustrates how taylor polynomials of higher degree, gets
% closer to the function and better approximates it.

x = linspace(-5,5,1000);

%define function to find derivative
syms t;
g=sin(t);

y=subs(g,t,x);

figure;
plot(x,y,'-','LineWIdth',2.5);
hold all;

legend('sine curve','First order','Second order');
xlabel ('x axis');
ylabel ('y axis');
title ('Taylors polynomials');

plot(x,0);
plot(0,-3:0.01:3)

xlim([-5 5]);
ylim([-3 3]);

% Find the derivatives
dg = diff(g,t);
dydx = subs(dg,t,x);


% Fst order
P = [subs(g,t,0)];
Px=polyval(P,x);
plot(x,Px);

% Draws taylor polynomials
for n=1:100
    P = [subs(dg,t,0)/factorial(n), P];
    Px=polyval(P,x);
    plot(x,Px)
    pause;
    dg = diff(g,t,n+1);
    dydx = subs(dg,t,x);
end
    