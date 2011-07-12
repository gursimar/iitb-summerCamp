clc
clear all;
close all;

importdata('TbRu2Ge2_zero.dat');
F_0 = ans.data(:,6);
T_0 = ans.data(:,8);
C_0 = ans.data(:,10);
F_0 = F_0(length(F_0):-1:1);
T_0 = T_0(length(T_0):-1:1);
C_0 = C_0(length(C_0):-1:1);
importdata('TbRu2Ge2_50kOe.dat');
F_50 = ans.data(:,6);
T_50 = ans.data(:,8);
C_50 = ans.data(:,10);
F_50 = F_50(length(F_50):-1:1);
T_50 = T_50(length(T_50):-1:1);
C_50 = C_50(length(C_50):-1:1);

f = @(x) ((x.^4) .* exp(x)) ./((exp(x)-1).^2);

