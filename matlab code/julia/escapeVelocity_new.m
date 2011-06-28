function n=escapeVelocity_new(Z0,c,N)
n=0;
Z=Z0;

while abs(Z)<=2 && n<N
    Z= Z - (((Z^3)-1)/(3*(Z^2)));
    %Z=(((Z^))+c);
    n=n+1;
end
