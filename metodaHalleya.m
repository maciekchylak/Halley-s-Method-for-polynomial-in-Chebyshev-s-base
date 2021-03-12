function [xn] = metodaHalleya(x,a, d, N)
%Funkcja znajdująca przybliżoną wartość 
%miejsca zerowego wielomianu zapisanego 
%w postaci wielomianów Czebyszewa przy użyciu
%metody Halleya
%Argumenty:
%x - liczba rzeczywista, punkt startowy z którego będziemy szukali 
%miejsca zerowego 
%a - niepusty numeryczny wektor współczynników wielomianu zapisanego 
%w bazie wielomianów Czebyszewa
%d - dodatnia liczba rzeczywista, warunek stopu algorytmu
%N - liczba naturalna dodatnia, maksymalna liczba iteracji jaką program ma wykonać. 
%W przypadku przekroczenia tej liczby program
% stwierdza, że algorytm nie jest zbieżny
%Wartość:
%xn - przybliżone miejsce zerowe wielomianu zapisanego w bazie wielomianów
%Czebyszewa
if nargin ~= 4 | ~isnumeric(d) | ~isnumeric(a) | ~isnumeric(N) ...
    | ~isnumeric(x) | isempty(a) | length(N) ~= 1 | length(d) ~= 1 | ...
    length(x) ~= 1 | floor(N) ~= ceil(N) | d <= 0 | N <=0  
   error('Blad danych wejsciowych'); 
end
xn = x;
eps = 1000;
i = 0;

while eps > d
    if(w_poch_wart(a, xn) == 0)
        disp("Algorytm nie jest zbieżny")
        xn = NaN;
        return 
    end
    if(i > N)
        disp("Program nie zbiega do miejsca zerowego z podaną dokładnością w ustalonej liczbie kroków");
        xn = NaN;
        return
    end
    xn1 = xn - ((2*w_wart(a, xn)* ...
    w_poch_wart(a, xn)) / (2*(w_poch_wart(a, xn).^2)  ...
    - w_wart(a, xn)*w_poch2_wart(a, xn)));
    eps = abs(xn1-xn);
    xn = xn1;
    i = i+1;
end

end