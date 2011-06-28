figure;
hold on;
N =100
zMax = 1;
c = -0.4+0.6i;

% julia
MAT=300;
mat=linspace(-zMax,zMax,MAT);
[MATx,MATy]=meshgrid(mat,mat);
Z=zeros(MAT,MAT);
M=zeros(MAT,MAT);
Z=MATx+i*MATy;

for k=1:MAT
    for j=1:MAT
        M(k,j)=escapeVelocity(Z(k,j),c,N);
    end
end

imagesc(atan(0.1*M));
axis xy;
xlabel('Re(z)'); ylabel('Im(z)');
colorbar;


%Now the main probelm exist. Whenever I try to plot Z it plots according to
%previous image axis which is from 0 to 300.

plot (linspace(0,300,3000),150,'LineWidth',3);
plot (150,linspace(0,300,300),'LineWidth',3);


Z0 = 1/3 - (1/3)*i;

%For points on the unit circle
theta = 1;
%Z0 = cos(theta) + sin(theta)*i;

clc;
Z=Z0;
plot ((Z.*150 +(150+150i)),'*','LineWidth',4);

hold all;
%legend ('1st','2nd','3rd','4th','5','6','7','8');
xlim([-20 320]);
ylim([-20 320]);


for n= 1:300
    pause;
    Z = Z^2 + c;
    plot ((Z.*150 +(150+150i)),'*','LineWidth',4);

end


