
clear all;
close all;
clc;

importdata('TbRu2Ge2_zero.dat')
F = ans.data(:,6);
T = ans.data(:,8);
C = ans.data(:,10);

% To make the data increasing
F = F(length(F):-1:1);
T = T(length(T):-1:1);
C = C(length(C):-1:1);

S0 = C(length(T))/T (length(T))/2;

P = polyfit(T,C,20);
X = polyval (P,1:300);
I = zeros(1,300);

fun = @(x) (polyval(P,x)./x)

for n =1:300
    I(n) = quad(fun,2,n);
end

S1 = I + S0;

figure
hold all;
% Plot the given data
plot(T,C);

% Plot the given data using the polynomial approximated
plot(1:300,X);

% plot the integral
plot(1:300,S1)

% 2nd way
I2 = zeros(1,length(T));
for n=2:length(T)
    I2(n) = trapz(T(1:n),(C(1:n)./T(1:n)));
end

S2 = I2 + S0;
plot(T,S2);


% another data for magnetic...
importdata('TbRu2Ge2_50kOe.dat')
F = ans.data(:,6);
T = ans.data(:,8);
C = ans.data(:,10);

% To make the data increasing
F = F(length(F):-1:1);
T = T(length(T):-1:1);
C = C(length(C):-1:1);

S0 = C(length(T))/T (length(T))/2;

I3 = zeros(1,length(T));
for n=2:length(T)
    I3(n) = trapz(T(1:n),(C(1:n)./T(1:n)));
end

S3 = I3 + S0;
plot(T,S3);
