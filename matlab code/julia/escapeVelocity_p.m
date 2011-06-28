function n=escapeVelocity(Z0,c,N)
n=0;
Z=Z0;

while abs(Z)<=2 && n<N
    Z=((Z^2)+c);
    n=n+1;
end
