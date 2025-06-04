%Ayudantia TallerV ejercicio3 - PVF
%Ecuación 3x''+x'+2x = 0
syms x y z
%Condiciones de frontera o de borde
x0 = 0;%punto inicial
x1 = log(2);%-0.00103385;%-0.518575;%;%0.716702; %punto final
t0 = 1;
t1 = 2;%10;%4;%1;
%Puntos interiores
n = 2;
%calcula h
h = (t1-t0)/(n+1);
%calculamos los puntos de eje X
t = t0:h:t1;
y = [x0 x y x1];
ec = [];
for i = 1:length(t)-2
eq = (1/h^2)*(y(i+2)+y(i)-2*y(i+1)) + ((1/(2*h))*(y(i+2)-y(i))).^2 + y(i+1)+log(t(i+1));
ec = [ec eq];
end

[result] = NRG_3V(ec(1),ec(2),ec(3),[1; 1; 1],0.0000001,10);
result = [x0 result' x1];
%Error
f = (1/23)*exp(-((1/6)*x))*(sqrt(23)*sin((sqrt(23)*x)/6)+23*cos((sqrt(23)*x)/6));
f1 = diff(f,x);
x_ = 0:0.01:15;
y_ = double(subs(f,x,x_));
hold on
plot(x_,y_,'-.', 'DisplayName','Original');
plot(t,result,'-o', 'DisplayName','aprox');