% Bu MATLAB kodu, Fibonacci serisinin �nceki iki teriminin toplam�ndan 
% olu�an say�lar� �reterek ve bu say�lar�n �ift olup olmad���n� kontrol 
% ederek 4 milyona kadar olan �ift say�lar�n say�s�n� bulur.
% 
% Bu kod, Fibonacci serisini olu�tururken her terimin �nceki iki teriminin 
% toplam� oldu�unu kullan�r. D�ng�, belirlenen s�n�ra kadar devam eder ve 
% her terimi kontrol ederek �ift say� olup olmad���n� kontrol eder, 
% �iftse saya� artt�r�l�r. Sonunda, 4 milyona kadar olan �ift say�lar�n 
% toplam�n� ekrana yazd�r�r.

clear all;
close all;
clc;

% Fibonacci serisinin ilk iki terimi
f(1) = 1;
f(2) = 1;

% �ift say�lar�n sayac�
counter = 0;

% �terasyon indisini ba�lat
k = 2;

% Fibonacci serisi hesaplama ve �ift say�lar� sayma d�ng�s�
while f(k) < 4000000 % f(k) 4 milyondan k���k oldu�u s�rece d�ng� devam eder
    k = k + 1; % �ndisi bir artt�rarak ilerleriz.
    
    % Fibonacci serisinde her bir terim, �nceki iki terimin toplam�d�r
    f(k) = f(k-1) + f(k-2);
    
    % E�er say� �iftse
    if mod(f(k), 2) == 0
        counter = counter + 1; % �ift say�lar� sayar
    end
end

% Sonu�lar� ekrana yazd�rma
fprintf('4 Milyon say�s�na kadar %u tane �ift say� bulunur.\n', counter)