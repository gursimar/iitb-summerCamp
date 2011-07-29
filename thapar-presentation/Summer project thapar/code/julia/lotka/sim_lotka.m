close all;
clear all
clc
%Lotka volterra predator prey model
[t,x] = ode45(@lotka_sim, [0, 365], [100, 10])
plot(t,x(:,1),'lineWidth',1.5);
hold all;
plot(t,x(:,2),'lineWidth',1.5);

xlabel('Time (unit)');
ylabel('Population');
title('Lotka volterra predator prey model with 100 rabits and 10 foxes');
legend('Rabits','Foxes');

% To plot the phase plot
figure
plot(x(:,1),x(:,2),'lineWidth',1.5);
xlabel('Rabitts');
ylabel('Foxes');
title('Phase plot of Lotka volterra predator prey model with 100 rabits and 10 foxes');

