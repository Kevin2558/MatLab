%% Polinomio Chebyshev
a=-5;
b=5;
f=@(x) 1./(1+x.^2);
%nodos equiespaciados

fplot(f,[a b],'--')

x1=a:b;
p=polyfit(x1,f(a:b),10);

x=linspace(a,b); %para que el grafico sea continuo
figure(1)
hold on
plot(x,polyval(p,x),'r')


xs=a:.5:b;
sp=spline(x1,f(x1),xs);

plot(xs,sp,'g-')
hold off
%% Nodos de Chebyshev
a=-5;
b=5;
nmax=10;
for j=1:nmax+1
    nodo(j)=(b+a)/2+(b-a)*cos((2*(j-1)+1)*pi/(2*nmax+2))/2;
end

pchev=polyfit(nodo,f(nodo),nmax);
x=linspace(a,b);
hold on
plot(x,polyval(pchev,x),'b',nodo,f(nodo),'*b')
hold off