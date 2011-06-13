close all;
clear all;
clc

% Given parameters
r=1;
i=1;
x0 = 0;
y0 = 0;

% Draw the ring
%plot(0,0,'*','LineWidth',3);

% Make a matrix of points for computation
x = [-5:0.1:5];
y = [-5:0.1:5];
[X,Y]= meshgrid(x,y);

result = zeros(size(X));

% Constant Q = mu0*i/4pi
Q = i*1e-7;

% Perform integration for each such point
%result(:,:)=quad(@(z) z/(sqrt((X(:,:)-x0).^2 + (Y(:,:)-y0).^2 ) + z.^2),z1,z2);



for n = 1:length(y)
    %row 
    theta = atan(y(n)/r);
    result(n) = Q * 2*pi/r * (cos(theta)).^2;
end

%This shows exactly the magnetic field at any point z along the axis
%through the loop of radius b. However, it becomes merely an approximation when you insert anything (such as an iron projectile!) that disturbs the field.
plot(y,result);
