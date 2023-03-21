% € será el error aceptable
% No convergencia viendo que ||x*-x|| < €||x|| no tiene sentido porque desconocemos x
% Una forma mejor es ver que la diferencia de x_i e x_i-1 es suficientemente pequeño. No es buen criterio porque es posbile que la convergencia sea muy lenta.
% Otra forma es sustituir x^k en Ax = b y ver el error respecto de b: -r_k = ||Ax_k - b|| < €||b||
% Para calcular r_k no podemos hacerlo directamente porque sería muy costoso. Por tanto, lo que hacemos es:
% D_x_{k+1} = (E + F)x_k + b = Dx_k (- Ax_k + b). El paréntesis es r_k 
% r_k = D(x_{k+1} - x_k) 


% Entrada:
%   1) A: Matriz nxn invertible con diagonal no nula
%   2) b: Vector de n términos independientes 
% Salida PA = LU:
%   1) x: Solución aproximada del sistema. Vector n
%   2) E: Escalar con la precisión del problema
function [x, E] = Jacobi_CalvarroMarinesMario(A, b)
    k = 100000; %Máximo nº de iteraciones TODO: Cambiar dependiente al tamaño de la matriz
    E = 0.001; %Precisión del resultado
    [n, ~] = size(A);
    
end 
