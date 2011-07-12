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
figure
plot(T_I,C_0_I,'LineWidth',1.5);
hold all;

I_0 = zeros(1,length(T_I));
CbyT_0 = C_0_I./T_I;
for n=2:length(T_I)
    I_0(n) = trapz(T_I(1:n),CbyT_0(1:n));
end

% another data for magnetic...
importdata('TbRu2Ge2_50kOe.dat');
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
plot(T_I,C_50_I,'LineWidth',1.5);
xlabel ('Temperature (K)')
ylabel ('Specific heat capacity')
title ('Specific heat capacity vs Temperature at various values of magnetic field ')
legend('0 KOestred','50 KOestred');

I_50 = zeros(1,length(T_I));
CbyT_50 = C_50_I./T_I;
for n=2:length(T_I)
    I_50(n) = trapz(T_I(1:n),CbyT_50(1:n));
end

% New figure to plot the values of entropy
figure;
% To plot the values of S_0
S_0 = I_0 + S0_0;
plot(T_I,S_0,'LineWidth',1.5);
hold all;

S_50 = I_50 + S0_50;
plot(T_I,S_50,'LineWidth',1.5);

% Now find deltaSM
SM_0_50 = S_0-S_50;
plot(T_I,SM_0_50,'LineWidth',1.5);
hold on;

% Highlight maximum
[M_S_0_50,I] = max(SM_0_50);
T_I(I);

plot(T_I(I),-10:0.01:150)


xlabel ('Temperature (K)')
ylabel ('Entropy (S)')
title ('Entropy vs Temperature at various values of magnetic field')
legend('0 KOestred','50 KOestred','\Delta S_M');

xlabel ('Temperature (K)')
ylabel ('Entropy (S)')

% To plot delta SM_0_50 in a separate plot
figure
hold on;
xlabel ('Temperature (K)')
ylabel ('Entropy (\Delta S)')
title ('\Delta S_M vs Temperature')
plot(T_I,SM_0_50,'LineWidth',1.5);
hold on;

% Highlight maximum
disp ('The maximum of Delta S_M');
[M_S_0_50,I] = max(SM_0_50)
T_I(I)

plot(T_I(I),0:0.01:1.5)

% TO FIND DELTA TM FROM DELTA SM DATA
% first we have to interpolate the data
figure
S_I = 1:0.1:180;
T_0_I = interp1 (S_0,T_I,S_I);
T_50_I = interp1 (S_50,T_I,S_I);

T_0_50_I = T_50_I - T_0_I;

plot(S_I,T_0_50_I,'LineWidth',1.5);
hold all;

plot(S_I,T_0_I)
plot(S_I,T_50_I)

legend('T_5_0_,_I','T_0_I','T_5_0_I');


% Highlight maximum
disp ('The overall maximum of Delta T');
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
title('Variation of \Delta T_a_d vs T_0');
xlabel ('Temperature (T)');
ylabel('\Delta T_a_d');

plot(T_0_I,T_0_50_I,'LineWidth',1.5);

% plot max
disp ('The relevant maximum of Delta T vs T_0');
[M_T_0_50 I] = max(T_0_50_I(78:end))
I=I+78;
T_0_I(I)

% To highlight maximum
plot(T_0_I(I),-1:0.01:7)
