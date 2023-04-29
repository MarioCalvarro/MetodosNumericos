% Entrada (vectores horizontales):
%   1) x: Puntos en los que queremos interpolar (n+2)
%   2) y: Imágenes de los puntos a interpolar
%   3) X: Coordenadas donde queremos conocer el valor de la interpolación (N)
% Salida:
%   1) Y1: Imagen del polinomio en (x0, ..., xn)
%   2) Y2: Escalar con la precisión del problema
function [Y1, Y2] = InterpolacionPolinomica_CalvarroMarinesMario(x, y, X)
    [~, n] = size(x);
    n = n - 2;
    [N, ~] = size(X);

    tabla_diferencias = zeros(n+2);
    tabla_diferencias(:, 1) = y;
    for i=2:n+2
        for ii=1:n-i+3
            tabla_diferencias(ii, i) = (tabla_diferencias(ii, i-1) - tabla_diferencias(ii + 1, i - 1)) / (x(ii) - x(ii + i - 1));
        end
    end
    Ni = [1 -x(1)];
    p = tabla_diferencias(1,1) * Ni;
    for i=2:n+1
        Ni = conv(Ni, [1 -x(i)]);
        p = [0 p] + tabla_diferencias(1, i) * Ni;
    end
    Y1 = polyval(p, X);

    Ni = conv(Ni, [1 -x(n+2)]);
    p2 = [0 p] + tabla_diferencias(1, n+2) * Ni;
    Y2 = polyval(p2, X);


    r = linspace(min(x), max(x), 100);

    plot(r, polyval(p, r));
    hold on;
    plot(X, Y1, '.');
    hold on;

    plot(r, polyval(p2, r));
    hold on;
    plot(X, Y2, '.');
    hold on;
end 
