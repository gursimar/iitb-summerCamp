clc
close all;
clear all;


c=-2;
freq = 100;
freq2 = 100;
Z0 = 1.2 + 0i;

clc;
Z=Z0

W = linspace(0,0,freq);

for n= 1:freq 
    W(n)=Z;
    Z = Z^2 + c;
end

% data with mean
figure
title ('Random sample taken from Julia set iterations  bw [-2 2]. Taken for sample size=100')

ylabel ('Data');
hold on;
plot(W);
ylim([-6, 6])

%plot(0:0.1:freq,2,'--')
%plot(0:0.1:freq,-2,'--')

plot(0:0.1:freq,mean(W),'m')
legend('Data','Mean')



% TO STUDY MEAN WITH SAMPLE SIZE
figure
hold on;

Z0 = 1.2 + 0i;

clc;

mn = linspace(0,0,freq2-10);
sum = zeros(freq2-10,1);

for k = 11:freq2
    Z=Z0;
    for n=1:k
 %       W_2(k,n)=Z;
        sum(k-10) = sum(k-10) + Z;
        Z = Z^2 + c;
    end
    mn(k-10) = sum(k-10)/k;
end

plot(11:1:freq2,mn);
hold on;

plot(11:0.1:freq2,0);
title('Studying relation of mean with sample size');
xlabel('Sample size');
ylabel('Mean(s)');

        
