%Ayudantia S11 - PVI
syms x y z

U = @(t,u1,u2)[u2;-(2/3)*u1-(1/3)*u2];
U_0 = [1;0];
xi = 0;
xf = 15;
n = 30;
h = (xf - xi)/n;
%Iteramos
x0 = [];
value = [];
%RK44 -Explicito
for i = 1:n
    if i == 1
        yn = U_0;
    else
        yn = Yn;
    end
    xn = xi + (i-1)*h;
    F1 = U(xn,yn(1),yn(2));
    F2 = U(xn+h/2,yn(1)+ (h/2)*F1(1),yn(2)+ (h/2)*F1(2));
    F3 = U(xn+h/2,yn(1)+ (h/2)*F2(1),yn(2)+ (h/2)*F2(2));
    F4 = U(xn+h,yn(1)+ h*F3(1),yn(2)+ h*F3(2));
    Yn = yn + (h/6)*(F1 + 2.*F2 + 2.*F3 + F4);
    fprintf('Aproximación de x(%s) es:\n',num2str(xn+h));
    disp(Yn);
    x0 = [x0 xn+h];
    value = [value Yn(1)];
end
%Error
f = (1/23)*exp(-((1/6)*x))*(sqrt(23)*sin((sqrt(23)*x)/6)+23*cos((sqrt(23)*x)/6));
f1 = diff(f,x);
x_ = 0:0.01:15;
y_ = double(subs(f,x,x_));
hold on
plot(x_,y_,'-.', 'DisplayName','Original');
plot(x0,value,'-', 'DisplayName','RK44 - Explicito');
YR = double([subs(f,x,3);subs(f1,x,3)]);
error = norm(abs(YR - Yn),'Inf');
disp(error);


%RK44 - Semi - implicito
x0 = [];
value = [];
for i = 1:n
    if i == 1
        yn = U_0;
    else
        yn = Yn;
    end
    xn = xi + (i-1)*h;
    F1 = U(xn,yn(1),yn(2));
    F2 = U(xn+h/2,yn(1)+ (h/2)*F1(1),yn(2)+ (h/2)*F1(2));
    F3 = U(xn+h/2,yn(1)+ (h/2)*F2(1),yn(2)+ (h/2)*F2(2));
    F4 = [x;y];
    F4 = U(xn+h,F4(1),F4(2));
    F4 = F4 - [x;y];
    [F4] = NRG_2V(F4(1),F4(2),[1; 1],0.0000001,10);
    Yn = yn + (h/6)*(F1 + 2.*F2 + 2.*F3 + F4');
    fprintf('Aproximación de y(%s) es:\n',num2str(xn+h));
    disp(Yn);
    x0 = [x0 xn+h];
    value = [value Yn(1)];
end
%Error
hold on
plot(x0,value,'-', 'DisplayName','RK44 - SemiImplicito');
YR = double([subs(f,x,3);subs(f1,x,3)]);
error = norm(abs(YR - Yn),'Inf');
disp(error);