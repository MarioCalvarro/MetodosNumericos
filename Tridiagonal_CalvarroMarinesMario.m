% Entrada: 
%   1) d: diagonal principal. n componentes.
%   2) a: diagonal inferior. n-1 componentes. Empieza en a2.
%   3) c: diagonal superior. n-1 componentes.
%   4) b: terminos independientes. n componentes.
% Salida:
%   1) x: vector solución. n componentes.
function [x] = Tridiagonal_CalvarroMarinesMario(d, a, c, b)
    n = size(d);
    if (size(a) ~= (n - 1) || size(c) ~= (n-1) || size(b) ~= n) 
        ME = MException('myComponent:inputError', 'Input does not have the expected format.');
        throw(ME);
    end

    m = zeros([n, 1]); g = zeros([n, 1]);
    m(1) = d(1); g(1) = b(1)/m(1);
    for i = 2:n
        % Restamos 1 a "a" porque en la fórmulas dadas empieza en 2.
        m(i) = d(i) - c(i - 1) / m(i - 1) * a(i - 1);
        g(i) = (b(i) - g(i - 1) * a(i - 1)) / m(i);
    end

    x = zeros([n, 1]);
    x(n) = g(n);
    for i = n-1:-1:1
        x(i) = g(i) - c(i) / m(i) * x(i+1);
    end
end
