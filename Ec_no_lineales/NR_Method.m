function [result] = NR_Method(func,xr,error,max_iteration)
%NewtonRaphson
%Se definen variables simbolicas
syms x
%Calculamos la derivada
dfunc = diff(func,x);
%Acondicionamiento de variables
iter = 0;
ea = 0;
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
    %Aproximación
    xr_old = xr;
    xr = xr - double((subs(func,x,xr)))/double((subs(dfunc,x,xr)));
    iter = iter + 1;
    %condiciones de termino de aproximación
    if xr ~= 0
        ea = abs((xr - xr_old));
    end
    if ea <= error || iter >= max_iteration
        values = [values double(xr)];
        iteration  = [iteration iter];
        errors = [errors double(ea)];
        break;
    end
        %fprintf('iteracion %d = %10.10f / Error = %10.10f\n',iter,xr,ea);
end
%Create Table
result = table(iteration',values',errors','VariableNames',{'Iteraciones' 'Xr' 'Error'});
end