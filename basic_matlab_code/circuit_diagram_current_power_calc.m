clear all;
close all;
clc;

% Devre matrislerini tan�mla
A = [26 -20 0; -16 41 -6; -4 -6 24];
B = [10 5 0];

% Devre matrisinin determinant�n� hesapla
detA = det(A);

% Matrislerin �e�itli kombinasyonlar� olu�turulur
matrix1 = [10 -20 0; 5 41 -6; 0 -6 24];
matrix2 = [26 10 0; -16 5 -6; -4 0 24];
matrix3 = [26 -20 10; -16 41 5; -4 -6 0];

% Olu�turulan matrislerin determinantlar�n� hesapla
det1 = det(matrix1);
det2 = det(matrix2);
det3 = det(matrix3);

% Kofakt�rlerden ak�ma ve enerjiye ula�ma
Is = det1 / detA;   % Ak�m
I2 = det2 / detA;   % Ak�m
I3 = det3 / detA;   % Ak�m
P = 8 * I3^2;       % Enerji

% Sonu�lar� ekrana yazd�r
fprintf('8 Ohm �zerinde harcanan enerji: %8.2f Watt\n', P)
fprintf('10V sa�lad��� ak�m de�eri: %8.2f Amper\n', Is)
