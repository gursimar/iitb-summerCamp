% This script simulates a fair coin and plots its various results.

N=100;
H=0;
T=0;

headbytail = zeros (1,N);

for n=1:N
    k=rand;
    if(k<0.5)
        H=H+1;
    else
        T=T+1;
    end
    headbytail(n) = H/n;
end
    
plot(1:N,headbytail,'LineWidth',1.5);
hold all;
%plot(1:N,0.5);
ylim ([0 1]);
headbytail(N)
title('Ratio of heads')
xlabel ('No of trails')
ylabel ('Ratio of heads')