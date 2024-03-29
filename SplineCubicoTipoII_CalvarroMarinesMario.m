% Entrada (vectores horizontales):
%   1) x: Vector n+1 de puntos a interpolar
%   2) y: Vector de las imágenes de x
%   3) y0p: Valor de la derivada en el extremo inicial
%   4) ynp: Valor de la derivada en el extremo final
%   5) X: Vector n donde queremos conocer la interpolación
% Salida:
%   1) Y: Imágenes del vector X por la interpolación
function [Y] = SplineCubicoTipoII_CalvarroMarinesMario(x, y, y0p, ynp, X)
    [~, n] = size(x); n = n - 1;
    d = 2 * ones([n+1, 1]);
    lambda = zeros(n, 1); lambda(1) = 1;
    mu = zeros(n, 1); mu(n) = 1;
    b = zeros(n + 1, 1); 
    b(1) = 6 / (x(2) - x(1)) * ((y(2) - y(1)) / (x(2) - x(1)) - y0p);
    b(n+1) = 6 / (x(n + 1) - x(n)) * (ynp - (y(n+1) - y(n)) / (x(n+1) - x(n)));

    for j = 1:n-1
        %Sumamos 1 a todos menos mu, porque empiezan en 0
        mu(j) = (x(j+1) - x(j)) / (x(j+2) - x(j));

        lambda(j+1) = (x(j+2) - x(j + 1)) / (x(j+2) - x(j));

        b(j+1) = 6 / (x(j+2) - x(j)) * ((y(j+2) - y(j+1)) / (x(j+2) - x(j+1)) - (y(j+1) - y(j)) / (x(j+1) - x(j)));
    end

    M = Tridiagonal_CalvarroMarinesMario(d, mu, lambda, b);

    %Matriz en la que cada fila es el polinomio correspondiente a un intervalo de la partición
    p = zeros(n, 4);
    for j = 1:n
        %Término independiente
        aux = [y(j)];

        %Segundo sumando
        Ni = [1 -x(j)];
        aux = [0 aux] + Ni * ((y(j+1) - y(j)) / (x(j+1) - x(j)) - (M(j+1) + 2*M(j)) / 6 * (x(j+1) - x(j)));
        
        %Tercer sumando
        Ni = conv(Ni, [1 -x(j)]);
        aux = [0 aux] + Ni * M(j) / 2;

        %Cuarto sumando
        Ni = conv(Ni, [1 -x(j)]);
    aux = [0 aux] + Ni * (M(j+1) - M(j)) / (6 * (x(j+1) - x(j)));

        p(j, :) = aux;
    end

    i = 1; [~, N] = size(X);
    Y = zeros(N, 1);
    for j = 1:n
        if i <= N && x(j) <= X(i) && X(i) < x(j+1)
            Y(i) = polyval(p(j,:), X(i));
            i = i + 1;
        end
        r = linspace(x(j), x(j+1), 100);
        plot(r, polyval(p(j,:), r));
        hold on;
    end

    plot(X, Y, '.');
    hold on;
end
