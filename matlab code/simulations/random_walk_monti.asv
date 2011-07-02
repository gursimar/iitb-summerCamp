close all;
clear all;
%clc

N=500;
L=1000;
x=0;
y=0;

distance = zeros(1,N);
end_points = zeros(L,2);

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
            y=y+2;
        elseif (k<0.75)
            % consider it as east
            x=x+1;
        else
            % consider it as south
            y=y-1;
        end
        % Calculate expected distance of the drunk from origin in each of the experiment.
        distance(l,n) = sqrt(x.^2 + y.^2);
    end
    end_points(l,1) = x;
    end_points(l,2) = y;
    
    % End of the experiment.
end
exp_distance_mean = mean(distance);

% Expected distance from origin
figure
hold on;
title('Random walk by a druken person');
xlabel ('No of steps');
ylabel('Expected Distance from origin');
plot(1:N,exp_distance_mean,'LineWidth',1.5);
hold off;
disp(exp_distance_mean(N));

figure
hold on;
title('Scatter plot of ending points of EW drunk');
xlabel ('EW distance');
ylabel('NS distance');
scatter(end_points(:,1),end_points(:,2),3);
