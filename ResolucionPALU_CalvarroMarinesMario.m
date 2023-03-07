% Entrada PA = LU:
%   1) A: Matriz con lo siguiente:
%     a. L: Matriz cuadrada n, triangular inferior
%     b. U: Matriz cuadrada n, triangular superior 
%   2) P: Vector con n componentes de permutaciones
%   3) b: Vector con n componentes del término independiente
% Salida:
%   1) x: Vector n solución de P^-1 L U x = b
function [x] = ResolucionPALU_CalvarroMarinesMario(P, LU, b)
    [n, ~] = size(A);
    y = zeros(1, n);
    y(1) = b(P(1));
    for i = 2:n
        aux = 0;
        for j = 1:(i-1) 
            aux = aux + LU(P(i), j) * y(j);
        end
        y(i) = b(P(i)) - aux;
    end

    x = zeros(1, n);
    x(n) = y(n) / a(P(n), n);
    for i = (n-1):1
        aux = 0;
        for j = (i+1):n)
            aux = aux + A(P(i), j) * x(j);
        end
        x(i) = (y(i) - aux) / A(P(i),i);
    end
end
