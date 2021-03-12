%skrypt służący do rysowania wykresu analizującego 
%prędkość wyznaczania miejsc zerowych przy użyciu metody Newtona w zależności od stopnia wielomianu
%zmieniamy tylko x, a, d, N według naszych preferencji
x = 1:0.1:1.9;
a = [1, 1, 0, 0, 0, 0;1, 1, 1, 0, 0, 0;1, 1, 1, 1, 0, 0;1, 1, 1, 1, 1, 0;1, 1, 1, 1, 1, 1];
d = 0.001;
N = 10;


nx = length(x);
na = length(a) - 1;
wynik = zeros(nx, na);


for i=1:nx
    for j =1:na
        Tstart = tic; 
        b = a(j,:);
        metodaHalleya(x(i),b(1:(j+1)), d, N);
        wynik(i, j) = toc(Tstart); 
    end
end
for k=1:5
    srednia(k) = mean(wynik(:,k));
end
figure
plot(1:5, srednia, "-*");
title("Średni czas znalezienia miejsca zerowego w zależności od stopnia wielomianu")
xlabel("Stopień wielomianu")
ylabel("Średni czas")
grid on