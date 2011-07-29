% Monti carlo simulation to estimate the value of pi

clear all;
close all;


N = 100000000;
inCircle =0;
pi_e = zeros(1,N);

for n = 1 : N
    x = rand;
    y = rand;
    
    if (x*x + y*y < 1)
        inCircle=inCircle+1;
    end
    
    %calculate pi
    pi_e(n) = 4 *inCircle/n;
end

disp (['The estimate of pi is ' num2str(pi_e(N))] );

%figure
%semilogx(1:N,pi_e,'LineWidth',1.5)
hold on;

title('Estimation of pi by monti carlo simulations')
xlabel('No of dots thrown');
ylabel('Estimate of pi');
plot(1:N,pi,'m')