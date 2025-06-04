function [p] = interpolacion_vandermonde(x,y,m)
%Diferencias Divididas de Newton
% x vector que contiene los valores de x de la forma [ x1 x2 x3...xn]
% y vector que contiene los valores de y de la forma [ y1 y2 y3...yn]
% n grado del polinomio que se deasea formar

%Definimos variables
x=x';y=y';
syms X
n = length(x);
if length(y)~=n, error('x e y deben tener el mismo tamaño'); end
if m>n-1, error('el maximo grado de polinomio es %d',n-1); end
A = zeros(n,n);
A(:,1) = ones(n,1);
B = y;
%Realiza las diferencias divididas
for i = 2:n
A(:,i) = x.^(i-1);
end
c = A\B;
%Se forma el polinomio en variable "X"
yint = 0;
for j = 1:length(c)
    xt = c(j)*X^(j-1);
    yint = yint + xt;
end
p = vpa(simplify(yint),10);
end