% To demonstrate the effect of roll yaw and pitch in matlab

close all;
clear all;
clc

%make a halicopter type figire

[X Y Z] = sphere (20)
surf(X.*2,Y,Z);
hold on;
surf(X+3,Y,Z);
axis equal