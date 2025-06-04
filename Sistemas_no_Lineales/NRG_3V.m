function [result] = NRG_3V(f1,f2,f3,points,error,max_iter)
%NRG
%f1,f2 funciones del sistema no lineal en variables x e y
% points contiene los puntos iniciales de la forma [x0 y0]
syms x y z

f1x = diff(f1,x);
f1y = diff(f1,y);
f1z = diff(f1,z);
f2x = diff(f2,x);
f2y = diff(f2,y);
f2z = diff(f2,z);
f3x = diff(f3,x);
f3y = diff(f3,y);
f3z = diff(f3,z);
xr = points;%[x0 y0 z0];
iter=0;
while (iter <= max_iter)
    xrold = xr;
    %Funcion evaluada en los puntos
    F(1,1)= subs(f1,[x y z],xr');
    F(2,1)= subs(f2,[x y z],xr');
    F(3,1)= subs(f3,[x y z],xr');
    %Jacobiano evaluado en los puntos
    A(1,1)=subs(f1x,[x y z],xr');
    A(1,2)=subs(f1y,[x y z],xr');
    A(1,3)=subs(f1z,[x y z],xr');
    A(2,1)=subs(f2x,[x y z],xr');
    A(2,2)=subs(f2y,[x y z],xr');
    A(2,3)=subs(f2z,[x y z],xr');
    A(3,1)=subs(f3x,[x y z],xr');
    A(3,2)=subs(f3y,[x y z],xr');
    A(3,3)=subs(f3z,[x y z],xr');
    A = double(A);
    F = double(F);
    %Nueva iteración
    xr = xr-((A^(-1))*F);
    %Control de condiciones
    iter=iter+1;
    if xr ~= 0
        ea(1,1) = abs((xr(1,1) - xrold(1,1)));
        ea(2,1) = abs((xr(2,1) - xrold(2,1)));
        ea(3,1) = abs((xr(3,1) - xrold(3,1)));
    end
    if norm(ea,Inf) <= error
        break;
    end
    fprintf(1,'iteracion %d; x = (%10.10f , %10.10f , %10.10f)\n',iter,xr(1,1),xr(2,1),xr(3,1))
end
fprintf(1,'iteracion %d; x = (%10.10f , %10.10f , %10.10f)\n',iter,xr(1,1),xr(2,1),xr(3,1))
result = [double(xr(1,1)) double(xr(2,1)) double(xr(3,1))]';
end
