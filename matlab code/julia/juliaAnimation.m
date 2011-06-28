function juliaAnimation(zMax,c,N)
no=700;
mat = linspace(-zMax,zMax,no);
[R I] = meshgrid(mat,mat);
Z = R + i*I;

M = N*ones(length(Z));

for n = 1:N
    Z = Z.^2+c;
    z = find (abs(Z)>2);
    M(z)= n;
    Z(z) = NaN;
    imagesc(mat,mat,atan(0.1*M));
    axis xy;
    drawnow;
end