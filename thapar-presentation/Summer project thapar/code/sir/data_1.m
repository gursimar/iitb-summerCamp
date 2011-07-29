
clear all;
close all;
clc;

importdata('TbRu2Ge2_zero.dat');
F_0 = ans.data(:,6);
T_0 = ans.data(:,8);
C_0 = ans.data(:,10);

% To make the data increasing
F_0 = F_0(length(F_0):-1:1);
T_0 = T_0(length(T_0):-1:1);
C_0 = C_0(length(C_0):-1:1);

S0_0 = C_0(length(T_0))/T_0 (length(T_0))/2;

plot(T_0,C_0);
hold all;

I_0 = zeros(1,length(T_0));
for n=2:length(T_0)
    I_0(n) = trapz(T_0(1:n),(C_0(1:n)./T_0(1:n)));
end

S_0 = I_0 + S0_0;
plot(T_0,S_0);

% another data for magnetic...
importdata('TbRu2Ge2_50kOe.dat');
F_50 = ans.data(:,6);
T_50 = ans.data(:,8);
C_50 = ans.data(:,10);

% To make the data increasing
F_50 = F_50(length(F_50):-1:1);
T_50 = T_50(length(T_50):-1:1);
C_50 = C_50(length(C_50):-1:1);

S0_50 = C_50(length(T_50))/T_50 (length(T_50))/2;

I_50 = zeros(1,length(T_50));
for n=2:length(T_50)
    I_50(n) = trapz(T_50(1:n),(C_50(1:n)./T_50(1:n)));
end

S_50 = I_50 + S0_50;
plot(T_50,S_50);

legend('Function', 'S0' ,'SH')

% Now find deltaSM
SM_0_50 = S_0-S_50;

plot(T_50,SM_0_50)

% Highlight maximum
max(SM_0_50)
a = find(SM_0_50 >= 1.3225)
T_50(a)

plot(T_50(a),0:0.01:150)


% to find delta TM

% first we have to interpolate the data
figure
S_I = 0:0.1:180
T_0_I = interp1 (S_0,T_0,S_I);
T_50_I = interp1 (S_50,T_50,S_I);

T_50_0_I = T_50_I - T_0_I;

plot(S_I,T_50_0_I)
hold on;
xlim([0 50]);

title ('Variation of \delta T with S')
xlabel('Entropy (S)');
ylabel('Difference in Temperature \delta T')