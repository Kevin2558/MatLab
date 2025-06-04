function [p] = interpolacion_newton(x,y,m)
%Diferencias Divididas de Newton
% x vector que contiene los valores de x de la forma [ x1 x2 x3...xn]
% y vector que contiene los valores de y de la forma [ y1 y2 y3...yn]
% m grado del polinomio que se deasea formar

%Definimos variables
x=x';y=y';
syms X
n = length(x);
if length(y)~=n, error('x e y deben tener el mismo tamaño'); end
if m>n-1, error('el maximo grado de polinomio es %d',n-1); end
b = zeros(n,n);
b(:,1) = y(:);
%Realiza las diferencias divididas
for j = 2:n
    for i = 1:n-j+1
        b(i,j) = (b(i+1,j-1)-b(i,j-1))/(x(i+j-1)-x(i));
    end
end
P(1,:) = b(1,:);
xt = 1;
yint = b(1,1);
%Se forma el polinomio en variable "X"
for j = 1:m
    xt = xt*(X-x(j));
    yint = yint+P(1,j+1)*xt;
end
p = vpa(simplify(yint),10);
end