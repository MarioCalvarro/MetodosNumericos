% Entrada:
%   1) x: Puntos en los que queremos interpolar (n+2)
%   2) y: Imágenes de los puntos a interpolar
%   3) X: Coordenadas donde queremos conocer el valor de la interpolación (N)
% Salida:
%   1) Y1: Imagen del polinomio en (x0, ..., xn)
%   2) Y2: Escalar con la precisión del problema
function [Y1, Y2] = InterpolacionPolinomica_CalvarroMarinesMario(x)
    [n, ~] = size(x);
    n = n - 2;
    % N = size(X);
    %Y1 = zeros(n+1, 1);
    %Y2 = zeros(n+2, 1);

    N = zeros(n+1);
    aux = zeros([1, n+1]);
    aux(n) = 1;
    N(1,n) = 1; N(1, n+1) = x(1);

    for i = 2:n+1
        aux(n+1) = -x(i);
        display(aux);
        display(N(i,:));
        N(i,:) = conv(N(i-1,:), aux);
    end
    display(N);
end 
