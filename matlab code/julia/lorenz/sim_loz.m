close all


% To plot the solution of lorenz attractor
x0 = [-2 -3.5 21]; % initial values in a vector
[t, x] = ode45(@lorenz_sim, [0 10], x0);

figure;
plot(t,x,'LineWidth',1.5) % plots 3 plot of x,y and z
title('Solution of Lorenz equations with initial conditions x0 = [-2 -3.5 21]')
legend('x','y','z');
xlabel('Time');
ylabel('Value');

% To see effect of changing the initial values
figure;
plot(t,x(:,2),'g','LineWidth',1.5);
hold on;
x0 = [-2.04 -3.5 21];
[t, x] = ode45(@lorenz_sim, [0 10], x0);
plot(t,x(:,2),'r','LineWidth',1.5)
title('Effect of changing the initial values from [-2 -3.5 21] to [-2.04 -3.5 21]');
xlabel('Time');
ylabel('Value');
legend ('Previous curve', 'New curve');

% To see effect of using a different ode solver
figure;
plot(t,x(:,2),'LineWidth',1.5);
hold all;
[t2, x2] = ode23(@lorenz_sim, [0 10], x0);
[t3, x3] = ode23s(@lorenz_sim, [0 10], x0);
plot(t2,x2(:,2),'LineWidth',1.5)
plot(t3,x3(:,2),'LineWidth',1.5)
%plot(t2,x2(:,2))
%plot(t3,x3(:,2))
title('Effect of using different ode solvers');
xlabel('Time');
ylabel('Value');
legend ('ode45','ode23','ode23s');

figure
plot3(x(:,1),x(:,2),x(:,3),'LineWidth',1.5);

