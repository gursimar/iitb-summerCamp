% current_loop_mark.m
clear all
close all
clc

% current loop ============================================
a = 1 ; % radius of current loop
b = 0 ; % length of straight part
N = 360; % number of elements in current loop
M = 10; % number of elements in straight part of coil
dlength = b/M; % unit of length for each element in straight part
theta = zeros(1,N); % angle of current loop element
straight = ones(1,M); % matrix for straight elements
xC = zeros(1,N+M); % xyz coordinates for point current loop element
yC = zeros(1,N+M); 
zC = zeros(1,N+M);
dtheta = 360/N; 
theta(1) = dtheta/2;
theta(end) = 360-dtheta/2;

for c = 2 : N-1
    theta(c) = (c-1)*dtheta+theta(1);
end

for c = 1 : (N-1)/2
    xC(c) = a.*cosd(theta(c)); yC(c) = a.*sind(theta(c))+b/2;
end

for c = N/2 : N
    xC(c) = a.*cosd(theta(c)); yC(c) = a.*sind(theta(c))-b/2;
end

for c = N+1 : N+M
    xC(c) = -a; yC(c) = b/2-b/M;
end

for c = N+M+1 : N+2M
    xC(c) = a; yC(c) = -b/2+b/M;
end

L_N = 2*pi*a/N; % length of each current loop element
Lx_N = L_N.*cosd(90+theta); Ly_N = L_N.*sind(90+theta);

L_M = b/2;
Lx_M = [a a a a a -a -a -a -a -a];
Ly_M = [b/2 b/2-2*b/M b/2-4*b/M b/2-6*b/M b/2-8*b/M b/2 b/2-2*b/M b/2-4*b/M b/2-6*b/M b/2-8*b/M];

clear theta 

% Detector space (xP, yP, zP) where B is calculated ===================
NP = 500; % Detector points NP x N 
xPmax = 4*a; % Dimensions of detector space
yPmax = 4*a;
zPmin = 1*a/4; zPmax = 8*a;

xP = linspace(-xPmax,xPmax,NP);
yP = linspace(-yPmax,yPmax,NP);
%zP = linspace(zPmin,zPmax,NP);
[xxP yyP] = meshgrid(xP,yP);
Bx = zeros(NP,NP);By = Bx; Bz = Bx;

% Calculation of magnetic field B: sum over each current element
for c = 1 : N
   rx = xxP - xC(c);
   rz = zC(c);
   ry = yyP - yC(c);
   r = sqrt(rx.^2 + ry.^2 + rz.^2);
   r3 = r.^3;
   Bx = Bx + Ly_N(c).*rz./r3;
   By = By - Lx_N(c).*rz./r3;
   Bz = Bz + Ly_N(c).*rx./r3;
end

for c = N+1 : N+M
   rx = xxP - xC(c);
   rz = zC(c);
   ry = yyP - yC(c);
   r = sqrt(rx.^2 + ry.^2 + rz.^2);
   r3 = r.^3;
   Bx = Bx + Ly_M(c-N).*rz./r3;
   By = By - Lx_M(c-N).*rz./r3;
   Bz = Bz + Ly_M(c-N).*rx./r3;
end
    
B = sqrt(Bx.^2 + By.^2 + Bz.^2);
B = B./max(max(B)); % normalize B to 1

% GRAPHICS
figure(1);
pcolor(xxP,yyP,B.^0.1);
colormap(jet)
shading interp;
axis equal;
axis([-xPmax xPmax -yPmax yPmax]);
xlabel('x coordinate');ylabel('y coordinate');
set(gca,'XTick',[-xPmax:xPmax/10:xPmax]);
set(gca,'YTick',[-yPmax:yPmax/10:yPmax]);
%rectangle('Position',[-1 0 2 0.2],'FaceColor','k');
title('Magnetic field from racetrack coil')
colorbar 