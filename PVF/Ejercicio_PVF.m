%Ayudantia S12 - PVF
%Ecuación 3x''+x'+2x = 0
syms x y z
%Condiciones de frontera o de borde
x0 = 1;%punto inicial
x1 = 0.716702;%-0.00103385;%-0.518575;%;%0.716702; %punto final
t0 = 0;
t1 = 1;%10;%4;%1;
%Puntos interiores
n = 3;
%calcula h
h = (t1-t0)/(n+1);
%calculamos los puntos de eje X
t = t0:h:t1;
y = [x0 x y z x1];
ec = [];
for i = 1:length(t)-2
eq = (3/h^2)*(y(i+2)+y(i)-2*y(i+1)) + (1/(2*h))*(y(i+2)-y(i)) + 2*y(i+1);
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