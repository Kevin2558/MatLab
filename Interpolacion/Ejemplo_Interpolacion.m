syms X
x = 0: pi/2 : 2*pi;
y = sin(x);
n = 4;
xq = 0: pi/16 : 2*pi;
yq = sin(xq);
%Diferencias divididas de Newton
[p_newton] = interpolacion_newton(x,y,n);
disp('polinomio de newton');
disp(vpa(simplify(p_newton),10));
%Interpolación de Vandermonde
[p_vandermonde] = interpolacion_vandermonde(x,y,n);
disp('polinomio de vandermonde');
disp(vpa(simplify(p_vandermonde),10));

figure
subplot(2,1,1);
%Grafico de polinomio
yp = subs(p_newton,X,xq');
plot(x,y,'o',xq,yp,'-',xq,yq,'-.')
title('Newton Interpolation');
legend('Sample Points','Newton interpolation','sin(x)')

subplot(2,1,2); 
%Grafico de polinomio
yp = subs(p_vandermonde,X,xq');
plot(x,y,'o',xq,yp,xq,yq,'-.')
title('Vandermonde Interpolation');
legend('Sample Points','Vandermonde interpolation','sin(x)')


%Ejemplo usando comando de MATLAB
%MATLAB posee comandos especiales para realizar la interpolación de una
%lista de datos.

%EJEMPLO 1
%Nos permite ver los diferentes metodos de interpolación de MATLAB y su
%contraste con la curva real.

%Definimos los valores de la tabla
x = 0:pi/4:2*pi; 
v = sin(x);
%definimos los valores donde deseamos evaluar
xq = 0:pi/16:2*pi;
vq = sin(xq);
figure
subplot(3,1,1);
vq1 = interp1(x,v,xq,'linear');
plot(x,v,'o',xq,vq1,':.',xq,vq,'-');
xlim([0 2*pi]);
title('(Default) Linear Interpolation');
legend('Sample Points','linear interpolation','sin(x)')

subplot(3,1,2); 
vq1 = interp1(x,v,xq,'cubic');
plot(x,v,'o',xq,vq1,':.',xq,vq,'-');
xlim([0 2*pi]);
title('Cubic Interpolation');
legend('Sample Points','Cubic interpolation','sin(x)')

subplot(3,1,3); 
vq1 = interp1(x,v,xq,'spline');
plot(x,v,'o',xq,vq1,':.',xq,vq,'-');
xlim([0 2*pi]);
title('Spline Interpolation');
legend('Sample Points','Spline','sin(x)')

%EJEMPLO 2
%Nos permite ver la adaptación de la interpolación de spline a una señal
%con varias oscilaciones.

figure
x = 0:25;
y = besselj(1,x);
xq2 = 0:0.01:25;
%Grafico
subplot(2,1,1);
vq1 = interp1(x,y,xq2,'linear');
plot(x,y,'o',xq2,vq1,':.');
title('(Default) Linear Interpolation');
legend('Sample Points','linear interpolation')
subplot(2,1,2);
s = spline(x,y,xq2);
plot(x,y,'o',xq2,s,'-.')
title('Spline Interpolation');
legend('Sample Points','spline')

%EJMPLO 3

figure
x0=[2010 2011 2012 2013 2014 2015 2016 2017];
y0=[41462 28969 32251 47694 32265 27819 33539 36994];%VA
% x=2010:1:2017;
% y2=interp1(x0,y0,x)
% y3 = interp1 (x0, y0, x, 'spline')% interpolación spline cúbica
pp = spline(x0,y0);
coef = pp.coefs;% devuelve los coeficientes de cada segmento de la función 
%de interpolación spline cúbica, y cada segmento de la interpolación spline cúbica es un polinomio cúbico.
%coef = [a,b,c,d]
plot(x0,y0,'-o')
%EL polinomio formado por el comando Spline es de la forma
%f(x) = a(x-x1)^3 + b(x-x1)^2 + c(x-x1) + d
%donde a,b,c,d son los coeficientes del polinomio y x1 corresponde al
%limite inferior del intervalo del trazador cubico
%Para evaluar en diferentes puntos o trabajar con los valores podemos
%realizarlo de la siguiente forma
[n,~] = size(coef);
for i = 1:n
    hold on
    x = x0(i):0.1:x0(i+1);
    y = coef(i,1).*(x-x0(i)).^3+coef(i,2).*(x-x0(i)).^2+coef(i,3).*(x-x0(i)) + coef(i,4);
    plot(x,y,'-.');
end
%Tambien podemos obtener los coeficientes del polinomio del comando
%interp1() de la siguiente manera
pp = interp1(x0,y0,'Linear','pp');
disp(pp.coefs);
%Esto permite poder trabajar con los polinomios obtenidos y realizar
%diferentes operaciones, como derivar, integrar, calcular maximo minimos,
%raices, etc.
%Tambien puede consultar help griddedInterpolant
