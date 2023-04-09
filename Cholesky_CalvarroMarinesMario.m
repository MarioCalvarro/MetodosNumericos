% Entrada:
%   1) A: Matriz cuadrada n. Todos sus menores principales son distintos de 0
% Salida PA = LU:
%   1) B: Triangular inferior con diagonal positiva: A = BB*
function [B] = Cholesky_CalvarroMarinesMario(A)
    [n, ~] = size(A);
    B = zeros(n);
    for i = 1:n
        for j = 1:i
            aux = 0;
            if i == j
                for k = 1:i-1
                    aux = aux + abs(B(i,k))^2; 
                end
                B(i,i) = sqrt(A(i,i) - aux);
            else 
                for k = 1:j-1
                    aux = aux + B(i,k) * conj(B(j,k));
                end
                B(i,j) = (A(i,j) - aux) / B(j,j);
            end
        end
    end
end 
