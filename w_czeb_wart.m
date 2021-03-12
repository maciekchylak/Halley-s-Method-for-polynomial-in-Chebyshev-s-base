function [wart] = w_czeb_wart(n, x)
%Funkcja obliczająca wartość wielomianu Czebyszewa n-tego 
%stopnia w punkcie x
%Argumenty:
%n - stopień wielomianu Czebyszewa
%x - punkt w którym wartość wielomianu Czebyszewa
%chcemy policzyć
%Wartość:
%wart - wartosc wielomianu Czebyszewa n-tego 
%stopnia w punkcie x 
if n == 0
   wart = 1; 
   return
end

if n == 1
   wart = x;
   return
end
wart = 2*x*w_czeb_wart(n-1, x) - w_czeb_wart(n-2, x);
end