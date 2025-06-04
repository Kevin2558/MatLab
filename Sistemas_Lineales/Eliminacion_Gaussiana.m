%Eliminacion Gaussiana
function [result] = Eliminacion_Gaussiana(A,B)
[m,n] = size(A);
if m~=n, error('Matrix A must be square'); end
nb = n+1;
Ab = [A B];
% forward elimination
for k = 1:n-1
    for i = k+1:n
        factor = Ab(i,k)/Ab(k,k);
        Ab(i,k:nb) = Ab(i,k:nb)-factor*Ab(k,k:nb);
    end
end
% back substitution
x = zeros(n,1);
x(n) = Ab(n,nb)/Ab(n,n);
for i = n-1:-1:1
    x(i) = (Ab(i,nb)-Ab(i,i+1:n)*x(i+1:n))/Ab(i,i);
end
result = x;
end
