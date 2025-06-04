%% Pep 2 Año Pasado Parte 1
% a) Ajustar mediante minimos cuadrado (polinomio de segundo grado)
T = [0 6 12 18 24 30 36;
    104 114 128 132 127 113 101];
o = ones(7,1);
A = [o T(1,:)' T(1,:)'.^2];
b = T(2,:)';
y = A\b
f = @(x) y(1)+y(2).*x+y(3).*x.^2
fplot(f,[0,40],'b')
hold on
plot(T(1,:),T(2,:),'o')
e = sum((T(2,:)-f(T(1,:))).^2)
%%
% b) Ajustar mediante Vandermone (segundo grado)
x = [0 18 36];
y = [104; 132; 101];
M = [0 6 12 18 24 30 36;
    104 114 128 132 127 113 101];
vander(x); % Matriz Vandermonde
p = vander(x)\y; % Coeficientes del polinomio
xd = linspace(0,36);
yd = polyval(p,xd);
plot(x,y,'o',xd,yd)
g = @(l) p(1).*(l.^2)+ p(2).*l + p(3)
e = sum((M(2,:)-g(M(1,:))).^2)
%%
% b) Ajustar mediante polinomios de lagrange (segundo grado)
T = [0 18 36;
    104 132 101]
p=polyfit(T(1,:),T(2,:),2);
x=linspace(0,36); %para que el grafico sea continuo
figure(1)
hold on
plot(x,polyval(p,x),'r')
plot(T(1,:),T(2,:),'o')
% Polyfit te entrega los coeficientes al revés
g = @(l) p(1).*(l.^2)+ p(2).*l + p(3)
M = [0 6 12 18 24 30 36;
    104 114 128 132 127 113 101];
e = sum((M(2,:)-g(M(1,:))).^2) % error
%%
% c) Ajustar la curva a los datos
% f(x) = a + bcos(pix/36) + csin(pix/35) 
T = [0 6 12 18 24 30 36;
    104 114 128 132 127 113 101];
phi0 = @(x) 1;
phi1 = @(x) cos(pi*x/36);
phi2 = @(x) sin(pi*x/36);
a11 = sum(phi0(T(1,:)).^2);
a12 = sum(phi0(T(1,:)).*phi1(T(1,:)));
a13 = sum(phi0(T(1,:)).*phi2(T(1,:)));
a22 = sum(phi1(T(1,:)).^2);
a23 = sum(phi1(T(1,:)).*phi2(T(1,:)));
a33 = sum(phi2(T(1,:)).^2);
A = [a11,a12,a13;a12,a22,a23;a13,a23,a33];
b1 = sum(T(2,:).*phi0(T(1,:)));
b2 = sum(T(2,:).*phi1(T(1,:)));
b3 = sum(T(2,:).*phi2(T(1,:)));
b = [b1;b2;b3];
y = A\b;
f = @(x) y(1)+y(2)*cos((pi*x)/36)+y(3)*sin((pi*x)/36) 
fplot(f,[0,36])
hold on
plot(T(1,:),T(2,:),'o')
e = sum((T(2,:)-f(T(1,:))).^2)
%%
% ii) Use una de las aproximaciones para estimar la distancia recorrida a
% los 36 segundos
T = [0 6 12 18 24 30 36;
    104 114 128 132 127 113 101];
o = ones(7,1);
A = [o T(1,:)' T(1,:)'.^2];
b = T(2,:)';
y = A\b;
f = @(x) y(1)+y(2).*x+y(3).*x.^2;
q = integral(f,0,36)