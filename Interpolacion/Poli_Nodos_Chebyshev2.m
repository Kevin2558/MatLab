%% Polinomio Chebyshev
a=-2;
b=2;
f=@(x) (x.^2).*exp(-x.^2);
%nodos equiespaciados

fplot(f,[a b],'--')

x1=a:b;
p=polyfit(x1,f(a:b),4);

x=linspace(a,b); %para que el grafico sea continuo
figure(1)
hold on
plot(x,polyval(p,x),'r')


xs=a:.5:b;
sp=spline(x1,f(x1),xs);

plot(xs,sp,'g-')
hold off
f(0.5)
p % p son los coeficientes del polinomio de chebyshev
%% Nodos de Chebyshev
a=-2;
b=2;
nmax=10;
for j=1:nmax+1
    nodo(j)=(b+a)/2+(b-a)*cos((2*(j-1)+1)*pi/(2*nmax+2))/2;
end

pchev=polyfit(nodo,f(nodo),nmax);
x=linspace(a,b);
hold on
plot(x,polyval(pchev,x),'b',nodo,f(nodo),'*b')
hold off