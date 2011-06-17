clear all;
close all;
clc;

v0 = [0 0 0]';  %initial velocity
B = [0 -4 0]';  %magnitude of B
E = [0 0 1]';
m = 5;  
q = 1;  
r0 = [-10 0 0]'; 
tspan = [0 70];

figure;

%to show B's direction
[x_q,y_q] = meshgrid(-15:8:15,-15:8:15);
z_q=10*ones(size(x_q));

u_q=B(1)*ones(size(x_q));
v_q=B(2)*ones(size(x_q));
w_q=B(3)*ones(size(x_q));
quiver3(x_q,y_q,z_q,u_q,v_q,w_q);
hold all;

% TO show electric field lines
z_q=-10*ones(size(x_q));

u_q=E(1)*ones(size(x_q));
v_q=E(2)*ones(size(x_q));
w_q=E(3)*ones(size(x_q));
quiver3(x_q,y_q,z_q,u_q,v_q,w_q);

%grid on;

%legend('Magnetic field' , 'Electric field');
xlabel ('x axis');
ylabel ('y axis');
zlabel ('z axis');
title ('Particle in a magnetic field')

% draw axis
a = -25:5:25;
b=zeros(length(a));
plot3(b,b,a,'k','LineWidth',1.5);
hold on;
plot3(a,b,b,'k','LineWidth',1.5);
plot3(b,a,b,'k','LineWidth',1.5);
%rotate3d();

xlim ([-15 15]);
ylim ([-15 15]);
zlim ([-15 15]);

y0 = [r0; v0];
f = @(t,y) [y(4:6); (q/m)*cross(y(4:6),B)+E];
[t,y] = ode23t(f,tspan,y0);

%To show animation
for n=1:length(y)
    plot3(y(n,1),y(n,2),y(n,3),'.r');
    pause(0.00001)
end