% script that simulates a moving particle with some initial velocity in a
% magnetic field B

v = [0 0 0];   %initial velocity
B = 5;    %magnitude of B
E = 5;
m = 5;          % mass
q = 1;          % charge on particle
r0 = [0 0 0];    % initial position of particle
t = 0;

w = q*B/m;

[t,v] = ode45(@(t,y)e_b(t,y,w,E,B),[0 20],[v(2), r0(2), r0(3), v(3)]);

plot(v(:,2),v(:,3));
