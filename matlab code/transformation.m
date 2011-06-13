%x=0:0.01:10
%y=x/100;

%plot(x,y);
%hold on;

%a=1/sqrt(2);
%M=[a a;-a a];

r=5;
theta = 45*pi/180;

x=-5:0.1:5
y=2.*x

x=r*cos(0:0.1:2*pi)
y=r*sin(0:0.1:2*pi)

z=linspace(0,0,length(x))

plot3(x,y,z,'r');
hold on;
xlim ([-10 10]);
ylim ([-10 10]);
zlim ([-10 10]);
title ('Demonstrating projects');

Rz=[cos(theta) -sin(theta) 0; sin(theta) cos(theta) 0; 0 0 1];
Rx=[1 0 0; 0 cos(theta) -sin(theta); 0 sin(theta) cos(theta)];
n_xyz = Rx*[x; y; z];

plot3(n_xyz(1,:),n_xyz(2,:),n_xyz(3,:),'b');




