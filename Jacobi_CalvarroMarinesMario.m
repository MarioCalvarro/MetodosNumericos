% € será el error aceptable

% No convergencia viendo que ||x*-x|| < €||x|| no tiene sentido porque desconocemos x

% Una forma mejor es ver que la diferencia de x_i e x_i-1 es suficientemente pequeño. No es buen criterio porque es posbile que la convergencia sea muy lenta.

% Otra forma es sustituir x^k en Ax = b y ver el error respecto de b: -r_k = ||Ax_k - b|| < €||b||
% Para calcular r_k no podemos hacerlo directamente porque sería muy costoso. Por tanto, lo que hacemos es:
% D_x_{k+1} = (E + F)x_k + b = Dx_k (- Ax_k + b). El paréntesis es r_k 
% r_k = D(x_{k+1} - x_k) 


% Entrada:
%   1) A: Matriz nxn invertible con diagonal no nula
%   2) b: Vector de n términos independientes (vertical)
% Salida:
%   1) x: Solución aproximada del sistema. Vector n
%   2) E: Escalar con la precisión del problema
%   3) conv: Booleano que indica si el método converge
function [x, E, conv] = Jacobi_CalvarroMarinesMario(A, b)
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
        d = r ./ diag(A);
        x = x + d;
    end
end 
