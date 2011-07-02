close all;
clear all;
clc

N=500;
L=100;
x=0;
y=0;

exp_distance = zeros(1,N);

for l = 1:L
    x=0;
    y=0;
        % This is one single experiment simulating 100 coin flipps
    for n=1:N
        k=rand;
        if(k<0.25)
            % consider it as west
            x=x-1;
        elseif (k<0.5)
            % consider it as north
            y=y+1;
        elseif (k<0.75)
            % consider it as east
            x=x+1;
        else
            % consider it as south
            y=y-1;
        end
        % Calculate expected distance of the drunk from origin in each of the experiment.
        exp_distance(l,n) = sqrt(x.^2 + y.^2);
    end
    % End of the experiment.
end


% Distance from origin
figure
hold on;
title('Random walk by a druken person');
xlabel ('No of steps');
ylabel('Distance from origin');
plot(1:N,exp_distance(1,:),'LineWidth',1.5);
hold all;
plot(1:N,exp_distance(2,:),'LineWidth',1.5);
plot(1:N,exp_distance(3,:),'LineWidth',1.5);

legend('First walk','Second walk','Third walk');

hold off;