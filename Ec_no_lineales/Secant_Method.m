function [result] = Secant_Method(func,xr,x1,error,max_iteration)
%Se definen variables simbolicas
syms x
%acondicionamiento de variables
%acondicionamiento de variables
iter = 0;
%variable auxiliares
values = [];
iteration = [];
errors = [];
%Ejecutamos aproximación
while (1)
    %Guardar variables
    values = [values double(xr)];
    iteration  = [iteration iter];
    if iter ~= 0
        errors = [errors double(ea)];
    else
        errors = [errors NaN];
    end
    xr_old = xr;
    xr = xr - double(((subs(func,x,xr))*(xr - x1)))/double(((subs(func,x,xr)) - (subs(func,x,x1))));
    iter = iter + 1;
    x1 = xr_old;
    %fprintf(1,'iteracion %d = %10.10f\n',iter,xr)
    %condiciones de termino de aproximación
    if xr ~= 0, ea = abs((xr - xr_old)); end
    if ea <= error || iter >= max_iteration
        values = [values double(xr)];
        iteration  = [iteration iter];
        errors = [errors double(ea)];
        break;
    end
end
%Create Table
result = table(iteration',values',errors','VariableNames',{'Iteraciones' 'Xr' 'Error'});
end