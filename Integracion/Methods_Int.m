%% Ejercicios Integración Clases
% Sea f(x)=1+exp(-x)sin(4x) aproximar el valor de su integral desde 0 a 1
% Regla compuesta del punto medio
a = 0;  % Límite inferior de integración
b = 1;  % Límite superior de integración
n = 2;  % Numero de particiones (nodos)
h = (b-a)/n;  % Largo intervalos
f = @(x) 1+exp(-x).*sin(4.*x);
I = h.*sum(f((h.*((1:n)-1)+h.*(1:n))/2)) % Formula del punto medio
%%
% Regla compuesta del trapecio
a = 0;
b = 1;
n = 4; 
h = (b-a)/n;
y = h:h:1-h;
f = @(x) 1+exp(-x).*sin(4.*x); % Función a integrar
s = sum(f(y));
I = h.*(s+(f(0)+f(1))/2) % Formula del trapecio
%%
% Regla compuesta de Simpson simple
a = 0;
b = 1;
n = 2;
h = (b-a)/(2*n);
y = 0:h:1;
f = @(x) 1+exp(-x).*sin(4.*x);
I = (h/3).*(f(y(1))+f(y(end))+4*sum(f(y(2:2:end-1)))+2*sum(f(y(3:2:end-1))))


