  % Codigo de Newton-Raphson Generalizado
 h = @(x_1,x_2) log(x_1^2+x_2^2)-sin(x_1*x_2)-log(2)-log(pi); % Definimos la funcion (1)
 m = @(x_1,x_2) exp(x_1-x_2)+cos(x_1*x_2); % Definimos la funcion (2)
 hx = @(x_1,x_2) (2*x_1/(x_1^2+x_2^2))-cos(x_1*x_2)*x_2; %Derivada parcial de h con respecto a x
 hy = @(x_1,x_2) (2*x_2/(x_1^2+x_2^2))-cos(x_1*x_2)*x_1; %Derivada parcial de h con respecto a y
 mx = @(x_1,x_2) exp(x_1-x_2)-sin(x_1*x_2)*x_2; %Derivada parcial de m con respecto a x
 my = @(x_1,x_2) -exp(x_1-x_2)-sin(x_1*x_2)*x_1; %Derivada parcial de m con respecto a y

 x_0 = [0.3;3] %Consideremos como x_0 el vector inicial

 J = [hx(x_0(1),x_0(2)),hy(x_0(1),x_0(2));
     mx(x_0(1),x_0(2)),my(x_0(1),x_0(2))]
 F = [h(x_0(1),x_0(2));
     m(x_0(1),x_0(2))]
 % Sea Jy = -F, además Ax=b, A\b
 y_0 = J\(-F)
 x_1 = x_0 + y_0
 J = [hx(x_1(1),x_1(2)),hy(x_1(1),x_1(2));
     mx(x_1(1),x_1(2)),my(x_1(1),x_1(2))]
 F = [h(x_1(1),x_1(2));
     m(x_1(1),x_1(2))]
 y_1 = J\(-F)
 x_2 = x_1 + y_1
 J = [hx(x_2(1),x_2(2)),hy(x_2(1),x_2(2));
     mx(x_2(1),x_2(2)),my(x_2(1),x_2(2))]
 F = [h(x_2(1),x_2(2));
     m(x_2(1),x_2(2))]
 y_2 = J\(-F)
 x_3 = x_2 + y_2
 J = [hx(x_3(1),x_3(2)),hy(x_3(1),x_3(2));
     mx(x_3(1),x_3(2)),my(x_3(1),x_3(2))]
 F = [h(x_3(1),x_3(2));
     m(x_3(1),x_3(2))]
 y_3 = J\(-F)
 x_4 = x_3 + y_3

 format long 