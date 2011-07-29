function rs = vander_de(t,X)
b = 1;
e = 0.01; % e can range from 0.01 and 1.0
rs = zeros(2,1;
rs(1) = X(2);
rs(2) = (e.*(1-(X(1).*X(1))) .* X(2)) - (b.*b .* X(1)) ;
