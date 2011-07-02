% script that simulates the throw of a ball from a height

% some constants
h0=[0 1.5];
g=[0 -9.8];
v0=[1 1];
theta = 45;

% make a time vector that divide the time interval into 1000 equally space
% intervals
t=0;
dt=0.01;

figure
plot(0:0.01:5,0);
hold on;

for n=1:100
    x = v0 * cos((pi/180)*theta)*t;
    y = h0 + ((v0 * sin((pi/180)*theta)).*t)-((1/2)*g*(t.*t));
    t=t+dt;
    plot(x,y);
end
