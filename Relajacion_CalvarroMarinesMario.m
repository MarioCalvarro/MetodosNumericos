% Tenemos, como en Jacobi, encontrar un r_k para ver cuando parar.
% r_k := b - ((D - E)x_k - Fx_{k-1})
% Criterio de parada: ||r_k|| < €||b||
% r_i_{k-1} = b_i - sum_{j=1}^{i-1} a_{ij} x_j_{k} - sum_{j=i}^{n} a_{ij} x_j_{k-1}
% x_i_k = x_i_{k-1} (1-w) - (r_i_{k-1} + a_{ii} x_i_{k-1})/(a_{ii}) * w

% Entrada:
%   1) A: Matriz nxn invertible con diagonal no nula
%   2) b: Vector de n términos independientes (vertical)
%   3) w: Parámetro de relajación entre 0 y 2 sin incluirlos
% Salida:
%   1) x: Solución aproximada del sistema. Vector n
%   2) E: Escalar con la precisión del problema
%   3) conv: Booleano que indica si el método converge
function [x, E, conv] = Relajacion_CalvarroMarinesMario(A, b, w)
    [n, ~] = size(A);
    iteraciones = n^2; %Máximo nº de iteraciones 
    E = 0.001; %Precisión del resultado
    conv = 0;

    norma_b = norm(b);
    r = zeros(n, 1);
    d = zeros(n, 1);
    x = zeros(n, 1);
    for k = 1:iteraciones
        r = b - A*x;
        if norma_b * E > norm(r)
            conv = 1;
            break;
        end
        d = w * (r ./ diag(A));
        x = x + d;
    end
end 
