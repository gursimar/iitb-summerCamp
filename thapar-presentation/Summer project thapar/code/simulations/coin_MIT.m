% This script simulates a coin flip 100 times and we can do N trials of the
% experiment

% Experiment - 100 coin flipps
% No of Trails - N

close all;
clear all;
%clc

N=1000000;
H=0;
T=0;

headbytail = zeros(1,N);
headminustail = zeros(1,N);


for l = 1:N
    H=0;
    T=0;
    % This is one single experiment simulating 100 coin flipps
    for n=1:50
        k=rand;
        if(k<0.5)
            H=H+1;
        else
            T=T+1;
        end
    end
    % End of the experiment.
    % We calculate H/T and H-T for each experiment.
    headminustail(l) = abs(H-T);
    headbytail(l) = headminustail(l)/(H+T)*100;
end

disp(mean (headminustail))