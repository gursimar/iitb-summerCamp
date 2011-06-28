zMax = 1;
c = 0;
N=100;

MAT=500;
mat=linspace(-zMax,zMax,MAT);
[MATx,MATy]=meshgrid(mat,mat);
Z=zeros(MAT,MAT);
M=zeros(MAT,MAT);
Z=MATx+i*MATy;

for k=1:MAT
    for j=1:MAT
        M(k,j)=escapeVelocity_new(Z(k,j),c,N);
    end
end

imagesc(atan(0.1*M));
axis xy;
xlabel('Re(z)'); ylabel('Im(z)');
colorbar;