% Entrada:
%   1) A: Matriz cuadrada n. Todos sus menores principales son distintos de 0
% Salida PA = LU:
%   1) LU: Matriz cuadrada n,
%      la parte triangular inferior será L (sin diagonal al saber que es 1)
%      la parte triangular superior será U
function [LU] = FactorizacionLU_CalvarroMarinesMario(A)
    [n, ~] = size(A);
    LU = zeros(n);
    for i = 1:n
        for j = 1:n
            aux = 0;
            if i <= j
                for k = 1:(i-1)
                    aux = aux + LU(i, k) * LU(k, j);
                end
                LU(i, j) = A(i, j) - aux;
            else
                for k = 1:(j-1)
                    aux = aux + LU(i, k) * LU(k, j);
                end
                LU(i, j) = (A(i, j) - aux) / LU(j, j);
            end
        end
    end
end 
