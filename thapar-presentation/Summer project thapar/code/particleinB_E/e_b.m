function dydx= e_b( t ,var,w,E,B)
%split dydx in variable in our equations
y1 = var(1);
y = var(2);
z = var(3);
z1 = var(4);

%w = 1;
%E=5;
%B=x5;

y1dot = w *z1;
ydot = y1;
zdot = z1;
z1dot = w*(E/B - y1); 

dydx = [y1dot;ydot;zdot;z1dot];
