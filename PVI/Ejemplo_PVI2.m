%Ayudantia Taller 5 - PVI
syms x y z

U = @(t,u1,u2,u3)[0.1*(-u1 + u3);0.1*(u1-u2);0.1*(u2-u3)];
U_0 = [100;0;0];
xi = 0;
xf = 15;
n = 15;
h = (xf - xi)/n;
%Iteramos
x0 = [0];
value_x1 = [100];
value_x2 = [0];
value_x3 = [0];
%RK44 -Explicito
for i = 1:n
    if i == 1
        yn = U_0;
    else
        yn = Yn;
    end
    xn = xi + (i-1)*h;
    F1 = U(xn,yn(1),yn(2),yn(3));
    F2 = U(xn+h/2,yn(1)+ (h/2)*F1(1),yn(2)+ (h/2)*F1(2),yn(3)+ (h/2)*F1(3));
    F3 = U(xn+h/2,yn(1)+ (h/2)*F2(1),yn(2)+ (h/2)*F2(2),yn(3)+ (h/2)*F2(3));
    F4 = U(xn+h,yn(1)+ h*F3(1),yn(2)+ h*F3(2),yn(3)+ h*F3(3));
    Yn = yn + (h/6)*(F1 + 2.*F2 + 2.*F3 + F4);
    %Euler
    %Yn = yn + h*F1;
    fprintf('Aproximación de x(%s) es:\n',num2str(xn+h));
    disp(Yn);
    x0 = [x0 xn+h];
    value_x1 = [value_x1 Yn(1)];
    value_x2 = [value_x2 Yn(2)];
    value_x3 = [value_x3 Yn(3)];
end
hold on
plot(x0,value_x1,'-', 'DisplayName','X1 - RK44 - Explicito');
plot(x0,value_x2,'-', 'DisplayName','X2 - RK44 - Explicito');
plot(x0,value_x3,'-', 'DisplayName','X3 - RK44 - Explicito');