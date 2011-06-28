clear all;
%close all;
clc

[t,x] = ode23(@vander_de,[0,100],[1 2]);
plot(x(:,1),x(:,2))
hold all;

title('van der pol equation');
xlabel('x(1)');
xlabel('x(2)');

legend('First solution','Second solution','Third solution','Fourth solution');