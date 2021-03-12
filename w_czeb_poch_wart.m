function [wartosc] = w_czeb_poch_wart(n, x)
%Funkcja obliczająca wartość pierwszej pochodnej 
%wielomianu Czebyszewa n-tego stopnia w punkcie x
%Argumenty:
%n - stopień wielomianu Czebyszewa
%x - punkt w którym wartość pierwszej pochodnej 
%wielomianu Czebyszewa chcemy policzyć
%Wartość:
%wart - wartosc pierwszej pochodnej wielomianu 
%Czebyszewa n-tego stopnia w punkcie x 

if n == 0
   wartosc = 0;
   return
end
if n == 1
   wartosc = 1;
   return
end

wartosc = 2*w_czeb_wart(n-1, x) ...
+ 2*x*w_czeb_poch_wart(n-1, x) - w_czeb_poch_wart(n-2, x);

end