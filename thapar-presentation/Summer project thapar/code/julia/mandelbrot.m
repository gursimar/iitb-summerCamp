function M=mandelbrot(zMax,N)
MAT=1000;
zmax_l=linspace(-zMax,zMax,MAT);
zmax_l_x=linspace(-2*zMax,0.7*zMax,MAT);
[MATx,MATy]=meshgrid(zmax_l,zmax_l);
C=zeros(MAT,MAT);
M=zeros(MAT,MAT);
Z=MATx+i*MATy;

for k=1:MAT
    for j=1:MAT
        M(k,j)=escapeVelocity(0,Z(k,j),N);
    end
end

imagesc(atan(0.1*M));
axis xy;
xlabel('Re(z)'); ylabel('Im(z)');
colorbar;