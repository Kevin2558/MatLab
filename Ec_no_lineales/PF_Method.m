function [result] = PF_Method(PF_func,xr,error,max_iteration)
%Punto Fijo
syms x %se definen variables simbolicas

%Convergencia
% d_pf_func = diff(PF_func,x);
% if abs(subs(d_pf_func,x,xr)) < 1
%     disp('es convergente');
% else
%     disp('NO es convergente');
% end

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
    xr = double(subs(PF_func,x,xr));
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
    fprintf('iteracion %d = %10.10f / Error = %10.10f\n',iter,xr,ea);
end
%Create Table
result = table(iteration',values',errors','VariableNames',{'Iteraciones' 'Xr' 'Error'});
end