% script that simulates a moving particle with some initial velocity in a
% magnetic field B

v = [3 4 1];   %initial velocity
B = [0 0 -5];    %magnitude of B
m = 5;          % mass
q = 1;          % charge on particle
r0 = [5 0 0];    % initial position of particle
t = 0;

%find velocity parallel to B and perpendicular to B
v_para = (dot(v,B)/norm(B))*(B/norm(B));
v_per = v-v_para;

% find the circles centre
r = m*(norm(v_per))/(q*norm(B));

theta = atan(v_per(2)/v_per(1))+pi/2;

xc=r0(1)+r*cos(theta);
yc=r0(2)+r*sin(theta);

w= norm(v_per)/r;

figure
%to show B's direction
[x_q,y_q] = meshgrid(-15:8:15,-15:8:15);
z_q=10*ones(size(x_q));
u_q=zeros(size(x_q));
v_q=zeros(size(x_q));
w_q=-6*ones(size(x_q));
quiver3(x_q,y_q,z_q,u_q,v_q,w_q);
hold all;

% To draw axis and all
plot3(-15:0.1:15,0,0);
hold on;
plot3(0,-15:0.1:15,0);
plot3(0,0,-15:0.1:15)


xlim([-15 15])
ylim([-15 15])
%zlim([-15 15])

%legend
xlabel ('x direction');
ylabel ('y direction');
zlabel ('z direction');
title('Motion of a particle in a magnetic field');

t=0;
%dt=0.01;
tic
for n=1:4000
    dt = toc;
    tic
    x=xc+r*cos(w.*t + pi+theta);
    y=yc+r*sin(w.*t + pi+theta);
    z=v_para*t;
    plot3(x,y,z,'--.');
    hold on
    t=t+dt;
    pause(0.00000000005)
end

