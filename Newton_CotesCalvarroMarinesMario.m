% Entrada:
%   1) f: Función 
%   2) a: Extremo izquierdo del intervalo
%   3) b: Extremo derecho del intervalo
%   4) n: 
%        Cerradas: {1, 2, 3}
%        Abiertas: {1, 2}
%   5) m: Nº de subintervalos
%   6) ab: 0 → Cerrado, 1 → Abierto
% Salida: 
%   1) sol: Valor de la integral

function [sol] = Newton_CotesCalvarroMarinesMario(f, a, b, n, m, ab)
x = zeros(m + 1, 1); %Puntos x_i
for i = 1:m
    x(i) = a + (b - a) * (i - 1) / m;
end

sol = 0;
if ab == 0 %Fórmula cerrada
    if n == 1 %Trapecio cerrada
        for i = 1:m
            sol = sol + Trapecio_cerrada(f, x(i), x(i+1));
        end
    elseif n == 2 %Simpson cerrada
        for i = 1:m
            sol = sol + Simpson_cerrada(f, x(i), x(i+1));
        end
    else %Simpson 3/8
        for i = 1:m
            sol = sol + Simpson_38(f, x(i), x(i+1));
        end
    end

else % Fórmula abierta
    if n == 1 %Trapecio abierta
        for i = 1:m
            sol = sol + Trapecio_abierta(f, x(i), x(i+1));
        end
    else %Simpson cerrada
        for i = 1:m
            sol = sol + Simpson_abierta(f, x(i), x(i+1));
        end
    end
end
end

function [sol] = Trapecio_cerrada(f, a, b)
    sol = (f(a) + f(b)) / 2 * (b - a);
end

function [sol] = Simpson_cerrada(f, a, b)
    sol = ((f(a) + 4*f((a + b) / 2) + f(b)) / 6) * (b - a);
end

function [sol] = Simpson_38(f, a, b)
    sol = ((2*f(a + (b - a) / 4) + 3*f(a + 2 * (b - a) / 3) + f(b)) / 3) * (b - a);
end

function [sol] = Trapecio_abierta(f, a, b)
    sol = ((f(a + (b - a) / 3) + f(a + 2 * (b - a) / 3)) / 2) * (b - a);
end

function [sol] = Simpson_abierta(f, a, b)
    sol = ((2*f(a + (b - a) / 4) - f(a + (b - a) / 2) + 2*f(a + 3*(b - a) / 4)) / 3) * (b - a);
end
