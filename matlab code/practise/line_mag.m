close all;
clear all;
clc

% Given parameters
i=1;
z1 = 2;
z2 = 8;
x0 = 0;
y0 = 0;

% Draw the Line in the z direction
plot(0,0,'*','LineWidth',3);

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
    
    for k= 1:length(x)
        f = @(z) z./(sqrt((x(k)-x0).^2 + (y(n)-y0).^2 ) + z.^2);
        result(n,k)=quad(f,z1,z2);
    end
end

%result = result./max(max(result)); % normalize the result

% GRAPHICS
figure(1);
pcolor(X,Y,result);%.^0.1);
hold on;
colormap(jet)
shading interp;
axis equal;
xlabel('x coordinate');
ylabel('y coordinate');
xlim ([-5 5]);
ylim ([-5 5]);
set(gca,'XTick',[-5:5/10:5]);
set(gca,'YTick',[-5:5/10:5]);
title('Magnetic field from a wire')
colorbar 

plot(0,0,'xb','LineWidth',2);



figure(2);
surf(X,Y,result*20);%.^0.1);
colormap(jet)
shading interp;
axis equal;
xlabel('x coordinate');
ylabel('y coordinate');
zlabel('Strength of magnetic field')
xlim ([-5 5]);
ylim ([-5 5]);
%set(gca,'XTick',[-5:5/10:5]);
%set(gca,'YTick',[-5:5/10:5]);
title('Magnetic field from a wire')
colorbar 

