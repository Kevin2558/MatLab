function [result] = SOR_Seidel(A,b,x,w,precision,max_iteration)
%Metodo de Seidel
[m,n] = size(A);
process = false;
if m~=n
    disp('Matrix A must be square');
else
    process = true;
end
if (process)
    %inicializacion de matrices
    D = zeros(n);
    L = zeros(n);
    U = zeros(n);
    E = zeros(n,1);
    for i = 1:n
        D(i,i) = A(i,i);
    end
    for i = 1:n
        for j=1:n
            if j<i
                L(i,j) = A(i,j);
            end
        end
    end
    for i = 1:n
        for j=1:n
            if j>i
                U(i,j)= A(i,j);
            end
        end
    end
    iter = 0;
    M = ((D+w.*L)^-1)*((1-w).*D-w.*U);
    %Norma
    r = norm(M,Inf);
    fprintf('SOR Seidel - Norma Infinit0: %d\n',r);
    %Radio espectral
    radio_espectral = max(abs(eig(M)));
    fprintf('SOR Seidel - Radio Espectral: %d\n',radio_espectral);
    %iteraciones
    values = [];
    iteration = [];
    errors = [];
    while (1)
        values = [values x];
        iteration = [iteration iter];
        if iter ~= 0
            errors = [errors double(ea)];
        else
            errors = [errors NaN];
        end
        xold = x;
        x= M*x + w.*((D+w.*L)^-1)*b;
        iter = iter+1;
        ea = norm(x - xold,Inf);
        if ea <= precision
            values = [values x];
            iteration = [iteration iter];
            errors = [errors double(ea)];
            break;
        end
        if iter >= max_iteration
            values = [values x];
            iteration = [iteration iter];
            errors = [errors double(ea)];
            break;
        end
    end
    result = table(iteration',values',errors','VariableNames',{'Iteraciones' 'Xr' 'Error'});
end
end