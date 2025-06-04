%% Guia Ejercicios Minimos Cuadrado e Interpolación
% 1. (a) Encontrar el polinomio de grado 1 que aporxime los datos en
% sentido de minimos cuadrados
y = 0:9;
z = [-0.1 1.1 1.9 3.2 3.8 5 6 7.3 8.1 8.9];
phi0 = @(x) 1;
phi1 = @(x) x;
a11 = sum(phi0(y).^2);
a12 = sum(phi0(y).*phi1(y));
a22 = sum(phi1(y).^2);
A = [a11,a12;a12,a22];
b1 = sum(z.*phi0(y));
b2 = sum(z.*phi1(y));
b = [b1;b2];
k = A\b;
f = @(x) k(1)+k(2).*x;
fplot(f,[0,9])
hold on
plot(y,z,'o')
%%
% Aproximar los datos a través de una función del tipo
% a*2^x+b*3^x+c
y = [-1 0 2 3];
z = [0.3 -0.2 7.3 23.3];
phi0 = @(x) 2.^x;
phi1 = @(x) 3.^x;
phi2 = @(x) 1;
a11 = sum(phi0(y).^2);
a12 = sum(phi0(y).*phi1(y));
a13 = sum(phi0(y).*phi2(y));
a22 = sum(phi1(y).^2);
a23 = sum(phi1(y).*phi2(y));
a33 = sum(phi2(y).^2);
A = [a11,a12,a13;a12,a22,a23;a13,a23,a33];
b1 = sum(z.*phi0(y));
b2 = sum(z.*phi1(y));
b3 = sum(z.*phi2(y));
b = [b1;b2;b3];
k = A\b;
f = @(x) k(1).*2.^x+k(2).*3.^x+k(3);
fplot(f,[-1,6])
hold on
plot(y,z,'o')
%%
y = [-1 0 1 3 6];
z = [6.1 2.8 2.2 6 26.9];
o = ones(5,1);
A = [o y' y'.^2];
b = z';
k = A\b;
f = @(x) k(1)+k(2).*x+k(3).*x.^2;
fplot(f,[-1,6])
hold on 
plot(y,z,'o')



