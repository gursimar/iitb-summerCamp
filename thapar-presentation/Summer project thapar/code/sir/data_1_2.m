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

S0_0 = C_0(1) / T_0(1)/2;

% Temperature range for interpolated data
T_I  = 2.7:0.1:296;

% Get interpolated C
C_0_I = interp1 (T_0,C_0,T_I);

% To plot the values of C vs T
plot(T_I,C_0_I);
hold all;

I_0 = zeros(1,length(T_I));
CbyT_0 = C_0_I./T_I;
for n=2:length(T_I)
    I_0(n) = trapz(T_I(1:n),CbyT_0(1:n));
end

% To plot the values of S_0
S_0 = I_0 + S0_0;
plot(T_I,S_0);

% another data for magnetic...
importdata('TbRu2Ge2_10kOe.dat');
F_50 = ans.data(:,6);
T_50 = ans.data(:,8);
C_50 = ans.data(:,10);

% To make the data increasing
F_50 = F_50(length(F_50):-1:1);
T_50 = T_50(length(T_50):-1:1);
C_50 = C_50(length(C_50):-1:1);

%S0_50 = C_50(1)/T_50(1)/2;
S0_50 = S0_0;

% Get interpolated C
C_50_I = interp1 (T_50,C_50,T_I);

% To plot the values of C vs T
plot(T_I,C_50_I);
hold all;

I_50 = zeros(1,length(T_I));
CbyT_50 = C_50_I./T_I;
for n=2:length(T_I)
    I_50(n) = trapz(T_I(1:n),CbyT_50(1:n));
end

S_50 = I_50 + S0_50;
plot(T_I,S_50);

% Now find deltaSM
SM_0_50 = S_0-S_50;

plot(T_I,SM_0_50);

legend('C_0', 'S_0','C_5_0' ,'S_5_0','\deltaS_0_,_5_0')

% Highlight maximum
disp ('The maximum of delta SM');
[M_S_0_50 I] = max(SM_0_50)
T_I(I)

plot(T_I(I),-10:0.01:150)
title ('\delta Plot of specific heats and their corresponding entropies');
xlabel ('Temperature');
ylabel ('\delta Entropy')


% To plot delta SM_0_50 in a separate plot
figure
hold on;
title ('\delta SM_0_,_5_0 with temperature');
xlabel ('Temperature');
ylabel ('\delta Entropy')
plot(T_I,SM_0_50);


% TO FIND DELTA TM

% first we have to interpolate the data
figure
S_I = 1:0.1:180;
T_0_I = interp1 (S_0,T_I,S_I);
T_50_I = interp1 (S_50,T_I,S_I);

T_0_50_I = T_50_I - T_0_I;

plot(S_I,T_0_50_I)
hold all;

plot(S_I,T_0_I)
plot(S_I,T_50_I)

legend('T_5_0_,_I','T_0_I','T_5_0_I');


% Highlight maximum
disp ('The maximum of delta T');
[M_T_0_50 I] = max(T_0_50_I)
S_I(I)
plot(S_I(I),-1:0.01:7)
hold on;

xlim([0 50]);

title ('Variation of \delta T with S')
xlabel('Entropy (S)');
ylabel('Difference in Temperature \delta T')

figure
hold on;
title('Variation of \delta T vs T_0_I');
xlabel ('T');
ylabel('delta Tad');

plot(T_0_I,T_0_50_I);

% plot max
disp ('The maximum of deltaT vs T');
[M_T_0_50 I] = max(T_0_50_I(78:end))
I=I+78;
T_0_I(I)

plot(T_0_I(I),-1:0.01:7)
