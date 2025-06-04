function [result] = Biseccion_Method(func, x_lower,x_upper,error,max_iteration)
%Biseccion
syms x
%Calculo de iteraciones esperadas
n = log((x_upper - x_lower)/error)/log(2);
disp(strcat('Iteraciones esperadas: ',num2str(n)));

%Validamos cambio de signo
test = subs(func,x,x_lower)*subs(func,x,x_upper);
process = false;
if vpa(test) > 0
    disp('ERROR: no sign change');
else
    process = true;
end
%acondicionamiento de variables
iter = 0;
xr = x_lower;
ea = 100;
%variable auxiliares
values = [];
iteration = [];
errors = [];
%Ejecutamos aproximación
while (process)
    xr_old = xr;
    %Calculamos valor medio
    xr = (x_upper + x_lower)/2;
    %Calculamos error
    if xr ~= 0
        ea = abs((xr - xr_old));
    end
    %Escogemos nuevo subintervalo
    test = subs(func,x,x_lower)*subs(func,x,xr);
    if test > 0
        x_lower = xr;
    elseif test < 0
        x_upper = xr;
    else
        ea = 0;
    end
    %guardamos valores
    if iter ~= 0
        values = [values xr];
        iteration  = [iteration iter];
        errors = [errors ea];
    end
    %aumentamos contador de iteración
    iter = iter + 1;
    % fprintf(1,'iteracion %d = %10.10f\n',iter,xr);
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
