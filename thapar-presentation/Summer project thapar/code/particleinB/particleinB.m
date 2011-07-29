% script that simulates a moving particle with some initial velocity in a
% magnetic field B

v = [0 5 0];   %initial velocity
B = [0 0 -5];    %magnitude of B
m = 5;          % mass
q = 1;          % charge on particle
r0 = [0 0 0];    % initial position of particle
t = 0;

% find the circles centre
r = m*(norm(v))/(q*norm(B));
%theta = acos(dot(v,cross(v,B)));
theta = atan(v(2)/v(1))+pi/2;

xc=r0(1)+r*cos(theta);
yc=r0(2)+r*sin(theta);

w= norm(v)/r;

figure
hold on;
plot(-10:0.1:10,0);
plot(0,-10:0.1:10);

%legend
xlabel ('x direction');
ylabel ('y direction');
zlabel ('z direction');
title('Motion of a particle in a magnetic field');

xlim([-10 10])
ylim([-10 10])


t=0;
%dt=0.01;
tic
for n=1:4000
    dt = toc
    tic
    x=xc+r*cos(w.*t + pi+theta);
    y=yc+r*sin(w.*t + pi+theta);
    plot(x,y,'.');
    t=t+dt;
    pause(0.00000000005)
end

