clear all;
close all;
clc;

% Devre matrislerini tanýmla
A = [26 -20 0; -16 41 -6; -4 -6 24];
B = [10 5 0];

% Devre matrisinin determinantýný hesapla
detA = det(A);

% Matrislerin çeþitli kombinasyonlarý oluþturulur
matrix1 = [10 -20 0; 5 41 -6; 0 -6 24];
matrix2 = [26 10 0; -16 5 -6; -4 0 24];
matrix3 = [26 -20 10; -16 41 5; -4 -6 0];

% Oluþturulan matrislerin determinantlarýný hesapla
det1 = det(matrix1);
det2 = det(matrix2);
det3 = det(matrix3);

% Kofaktörlerden akýma ve enerjiye ulaþma
Is = det1 / detA;   % Akým
I2 = det2 / detA;   % Akým
I3 = det3 / detA;   % Akým
P = 8 * I3^2;       % Enerji

% Sonuçlarý ekrana yazdýr
fprintf('8 Ohm üzerinde harcanan enerji: %8.2f Watt\n', P)
fprintf('10V saðladýðý akým deðeri: %8.2f Amper\n', Is)
