%% Pep 2 Año Pasado Parte 2
% (c) Considere la integral int(t*cos(1/t)) con limites a=0 y b=1
% Regla compuesta del trapecio
a = 0;
b = 1;
n = 500; 
h = (b-a)/n;
y = h:h:1-h;
f = @(x) x.*cos(1./x); % Función a integrar
s = sum(f(y));
I = h.*(s+(f(0+h)+f(1))/2) % Formula del trapecio
%%
% Regla compuesta de Simpson simple
a = 0;
b = 1;
n = 5500;
h = (b-a)/(2*n);
y = 0+h:h:1;
f = @(x) x.*cos(1./x);
I = (h/3).*(f(y(1))+f(y(end))+4*sum(f(y(2:2:end-1)))+2*sum(f(y(3:2:end-1))))

