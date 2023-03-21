% Tenemos, como en Jacobi, encontrar un r_k para ver cuando parar.
% r_k := b - ((D - E)x_k - Fx_{k-1})
% Criterio de parada: ||r_k|| < €||b||
% r_i_{k-1} = b_i - sum_{j=1}^{i-1} a_{ij} x_j_{k} - sum_{j=i}^{n} a_{ij} x_j_{k-1}
% x_i_k = x_i_{k-1} (1-w) - (r_i_{k-1} + a_{ii} x_i_{k-1})/(a_{ii}) * w

% Entrada:
%   1) A: Matriz nxn invertible con diagonal no nula
%   2) b: Vector de n términos independientes 
%   3) w: Parámetro de relajación entre 0 y 2 sin incluirlos
% Salida PA = LU:
%   1) x: Solución aproximada del sistema. Vector n
%   2) E: Escalar con la precisión del problema
function [x, E] = Relajacion_CalvarroMarinesMario(A, b, w)
    k = 100000; %Máximo nº de iteraciones TODO: Cambiar dependiente al tamaño de la matriz
    E = 0.001; %Precisión del resultado
    [n, ~] = size(A);
    
end 
