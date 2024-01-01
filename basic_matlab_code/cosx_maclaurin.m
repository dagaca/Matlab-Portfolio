function y = cosx_maclaurin(x,tol)

y = 1;
t = 1;
k = 1;

while (max(abs(t)) >= tol)
    t = t.*(-x.^2)./((2*k)*(2*k-1));
    y = y + t;
    k = k + 1;
end
end