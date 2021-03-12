function [suma] = w_poch2_wart(a, x)
%Funkcja obliczająca wartość drugiej pochodnej
%wielomianu zapisanego w bazie wielomianów Czebyszewa
%Argumenty:
%a - wektor współczynników wielomianu
%x - punkt w którym wartość drugiej pochodnej 
%wielomianu zapisanego w bazie Czebyszewa chcemy policzyć
%Wartość:
%suma - wartość drugiej pochodnej 
%wielomianu zapisanego w bazie Czebyszewa w punkcie x
n = length(a);
lista_w_czeb_wart = zeros(1, n);
lista_w_czeb_poch_wart = zeros(1, n);
lista_w_czeb_poch2_wart = zeros(1, n);
for i=1:n
    lista_w_czeb_wart(1, i) = w_czeb_wart(i-1, x);
    lista_w_czeb_poch_wart(1, i) = w_czeb_poch_wart(i-1, x);
    lista_w_czeb_poch2_wart(1, i) = w_czeb_poch2_wart(i-1, x);
end
suma = 0;
for j=1:n
    suma = suma + a(j)*(lista_w_czeb_poch2_wart(1, j)* ...
    lista_w_czeb_wart(1, n+1-j)+2*lista_w_czeb_poch_wart(1, j)* ...
lista_w_czeb_poch_wart(1, n+1-j) + lista_w_czeb_wart(1, j)* ...
    lista_w_czeb_poch2_wart(1, n+1-j));
end


end