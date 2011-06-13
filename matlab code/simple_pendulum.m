clear all
close all
clc
L=1;
g=10;
k=0;    %coefficient of friction

% This is chosen in accordance to the time period of the oscilation which
% is 2s, with the help of shanon sampling theorm.
h=0.01; %time step of solution

theta0 = 15*pi/180; %initial angle in radians

Tfinal = 6;
N=floor(Tfinal/h);

theta(1)= theta0;
theta(2) = theta0;

a1=(1/(h*h)+k/h);
a2=1/(h^2);
a3=-g/L;
b=2/h^2+k/h;
for n=1:N
    time(n)=(n-1)*h;
    if(n>2)
        theta(n)=a1*theta(n-1)+a2*theta(n-2)+a3*sin(theta(n-1))/b;
        omega(n)=(theta(n)-theta(n-1))/h;
    end
end
