function [result] = Halley_Method(func,xr,error,max_iteration)
%Halley method
%Se definen variables simbolicas
syms x
%acondicionamiento de variables
dfunc = diff(func,x);
ddfunc = diff(dfunc,x);
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
    %Aproximación
    xr_old = xr;
    xr = xr - double((2*(subs(func,x,xr))*(subs(dfunc,x,xr))))/double((2*(subs(dfunc,x,xr))^2 - (subs(ddfunc,x,xr))*(subs(func,x,xr))));
    iter = iter + 1;
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