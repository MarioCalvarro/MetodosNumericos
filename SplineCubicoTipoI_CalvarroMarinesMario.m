% Entrada:
%   1) x: Vector n+1 de puntos a interpolar
%   2) y: Vector de las imágenes de x
%   3) X: Vector n donde queremos conocer la interpolación
% Salida:
%   1) Y: Imágenes del vector X por la interpolación
function [Y] = SplineCubicoTipoI_CalvarroMarinesMario(x, y, X)
    n = size(x) - 1;
    A = 2 * eye(n);
    mu = zeros(n, 1); mu(n) = 0;
    lambda = zeros(n, 1); lambda(1) = 0;
    b = zeros(n + 1, 1); b(1) = 0; b(n+1) = 0;, 

    %TODO: Arreglar indices
    for j = 1:n
        mu(j) = (x(j) - x(j-1)) / (x(j+1) - x(j-1));
        lambda(j) = (x(j+1) - x(j)) / (x(j+1) - x(j-1));
        b(j) = 6/(x(j+1) - x(j-1)) * 
               ((y(j+1) - y(j)) / (x(j+1) - x(j)) - (y(j) - y(j-1)) / (x(j) - x(j-1)));
    end

    for i = 1:n
        for ii = 1:n
        end
    end
end
