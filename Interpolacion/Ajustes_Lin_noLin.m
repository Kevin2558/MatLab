%% Ajuste Lineal
b = [0.12; 0.153; 0.17; 0.225; 0.26];
m = [0,2,3,6,7]
A = [1 0; 1 2; 1 3; 1 6; 1 7];
C = A'*A
v = A'*b
y = C\v
g = @(x) y(1)+y(2)*x
fplot(g,[0,8])
hold on
plot(m,b,'.')
%% Ajuste Polinomial de grado 3
n = 0:0.5:5;
w = [10.5; 5.4844; 0; -3.6094; -4.5; -2.9531; 0; 2.9531; 4.5; 3.6094; 0];
for i=1:11
    B(i,1)=n(i)^3;
    B(i,2)=n(i)^2;
    B(i,3)=n(i);
    B(i,4)=1;
end
p = B\w
r = @(x) p(4)+p(3)*x+p(2)*x^2+p(1)*x^3
fplot(r,[0,5])
hold on
plot(n,w,'.')
%% Problema no lineal reducible a lineal
% En este caso haremos un ajuste exponencial
n = 0:0.4:2;
m = [3.1437, 4.4169, 6.0203, 8.6512, 11.0078, 16.2161];
% El ajuste es a una función f(x)=a*exp(b*x)
% Para lo cual aplicaremos ln función inversa a la exponencial
for i=1:6
    L(1,i) = log(m(i));
end
I = L';
for i=1:6
    G(i,1)=1;
    G(i,2)=n(i);
end
t = G\I;
a=exp(t(1));
b=t(2);
h = @(x) a*exp(b*x);
fplot(h,[0,2])
hold on
plot(n,m,'.')
%% Ajuste ejercicio propuesto
x = [-0.5, -0.19, 0.02, 0.2, 0.35, 0.5];
y = [-3.558, -2.874, -1.995, -1.04, -0.068, 0.677];
% Se quiere hacer un ajuste tal que la función sea de la forma
% a*sin(pi*x/2)+b*cos(pi*x/2)
A=[sin(pi*x'/2) cos(pi*x'/2)]
t=A\y'
j = @(x) t(1)*(sin((pi*x)/2))+t(2)*(cos((pi*x)/2))
fplot(j,[-0.5,0.6],'b')
hold on
plot(x,y,'o')
%% Ejercicio anterior como le gusta al ayudante
T = [-0.5 -0.19 0.02 0.2 0.35 0.5;
    -3.558 -2.874 -1.995 -1.04 -0.068 0.677]
phi0 = @(x) sin(pi.*x./2);
phi1 = @(x) cos(pi.*x./2);
a11 = sum(phi0(T(1,:)).^2)
a12 = sum(phi0(T(1,:)).*phi1(T(1,:)))
a22 = sum(phi1(T(1,:)).^2)

A = [a11,a12;a12,a22]
b1 = sum(T(2,:).*phi0(T(1,:)))
b2 = sum(T(2,:).*phi1(T(1,:)))
b = [b1;b2]
x = A\b







