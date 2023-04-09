% Entrada:
%   1) A: Matriz cuadrada n
% Salida PA = LU:
%   1) P: Vector con n componentes de permutaciones
%   2) LU: Matriz cuadrada n,
%      la parte triangular inferior será L (sin diagonal al saber que es 1
%      la parte triangular superior será U
function [p, LU] = FactorizacionPALU_CalvarroMarinesMario(A)
    [n, ~] = size(A);
    p = 1:n;
    for k = 1:n
        l = 0;
        aux = 0;
        for i = k:n
            if (abs(A(p(i), k)) > aux)
                l = i;
                aux = abs(A(p(i), k));
            end
        end

        if (A(p(l),k) ~= 0)
            t = p(l); 
            p(l) = p(k); 
            p(k) = t; 
            for i = k+1:n
                A(p(i),k) = A(p(i),k) ./ A(p(k),k);
                for j = k+1:n
                    A(p(i),j) = A(p(i),j) - A(p(i),k) .* A(p(k),j);
                end
            end
        end
    end 
    LU = A;
end
