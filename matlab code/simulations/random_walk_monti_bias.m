close all;
clear all;
%clc

N=500;
L=400;
x=0;
y=0;

distance = zeros(1,N);
end_points = zeros(L,1);

for l = 1:L
    x=0;
    y=0;
        % This is one single experiment simulating 100 coin flipps
    for n=1:N
        k=rand;
        if(k<0.5)
            % consider it as west
            x=x-1;
        else
            % consider it as east
            x=x+1;
        end
        % Calculate expected distance of the drunk from origin in each of the experiment.
        distance(l,n) = sqrt(x.^2 + y.^2);
    end
    end_points(l,1) = x;
    
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

figure
hold on;
title('Histogram of ending points of EW drunk');
xlabel ('EW distance');
ylabel('Number of trails');
hist(end_points);







disp(exp_distance_mean(N));