% Bu MATLAB kodu, Fibonacci serisinin önceki iki teriminin toplamýndan 
% oluþan sayýlarý üreterek ve bu sayýlarýn çift olup olmadýðýný kontrol 
% ederek 4 milyona kadar olan çift sayýlarýn sayýsýný bulur.
% 
% Bu kod, Fibonacci serisini oluþtururken her terimin önceki iki teriminin 
% toplamý olduðunu kullanýr. Döngü, belirlenen sýnýra kadar devam eder ve 
% her terimi kontrol ederek çift sayý olup olmadýðýný kontrol eder, 
% çiftse sayaç arttýrýlýr. Sonunda, 4 milyona kadar olan çift sayýlarýn 
% toplamýný ekrana yazdýrýr.

clear all;
close all;
clc;

% Fibonacci serisinin ilk iki terimi
f(1) = 1;
f(2) = 1;

% Çift sayýlarýn sayacý
counter = 0;

% Ýterasyon indisini baþlat
k = 2;

% Fibonacci serisi hesaplama ve çift sayýlarý sayma döngüsü
while f(k) < 4000000 % f(k) 4 milyondan küçük olduðu sürece döngü devam eder
    k = k + 1; % Ýndisi bir arttýrarak ilerleriz.
    
    % Fibonacci serisinde her bir terim, önceki iki terimin toplamýdýr
    f(k) = f(k-1) + f(k-2);
    
    % Eðer sayý çiftse
    if mod(f(k), 2) == 0
        counter = counter + 1; % Çift sayýlarý sayar
    end
end

% Sonuçlarý ekrana yazdýrma
fprintf('4 Milyon sayýsýna kadar %u tane çift sayý bulunur.\n', counter)