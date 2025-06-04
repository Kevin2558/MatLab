function [result] = NRG_2V(f1,f2,points,error,max_iter)
%NRG
%f1,f2 funciones del sistema no lineal en variables x e y
% points contiene los puntos iniciales de la forma [x0; y0]
syms x y
%f1=3*x^2-y^2
%f2=3*x*y^2-x^3-1

f1x = diff(f1,x);
f1y = diff(f1,y);
f2x = diff(f2,x);
f2y = diff(f2,y);
xr = points;%[x0; y0];
iter=0;
while (iter <= max_iter)
    xrold = xr;
    %Funcion evaluada en los puntos
    F(1,1)= subs(f1,[x y],xr');
    F(2,1)= subs(f2,[x y],xr');
    %Jacobiano evaluado en los puntos
    A(1,1)=subs(f1x,[x y],xr');
    A(1,2)=subs(f1y,[x y],xr');
    A(2,1)=subs(f2x,[x y],xr');
    A(2,2)=subs(f2y,[x y],xr');
    A = double(A);
    F = double(F);
    %Nueva iteración
    xr = xr-((A^(-1))*F);
    %Control de condiciones
    iter=iter+1;
    if xr ~= 0
        ea(1,1) = abs((xr(1,1) - xrold(1,1)));
        ea(2,1) = abs((xr(2,1) - xrold(2,1)));
        error_aprox = norm(ea,'Inf');
    end
    if ea(1,1) <= error || ea(2,1) <= error
        break;
    end
    fprintf(1,'iteracion %d; x = (%10.10f , %10.10f) con error = %10.15f\n',iter,xr(1,1),xr(2,1),error_aprox)
end
fprintf(1,'iteracion %d; x = (%10.10f , %10.10f) con error = %10.15f\n',iter,xr(1,1),xr(2,1),error_aprox)
result = [double(xr(1,1)) double(xr(2,1))];
end

