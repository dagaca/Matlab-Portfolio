%% sin-cos plot
% sin ve cos bir arada �izdirilmi�tir.
clear all;close all;clc

% 0 ile 2*pi aras�nda 100 adet nokta �reten x vekt�r� olu�tur
x = 0:pi/100:2*pi;

% sin(x) fonksiyonunu hesapla
y = sin(x);

% sin(x) fonksiyonunu mavi renkte �iz
plot(x, y)

% hold on komutu, bir grafik �zerine ba�ka bir grafik eklemek i�in kullan�l�r
hold on

% cos(x) fonksiyonunu hesapla
y2 = cos(x);

% cos(x) fonksiyonunu k�rm�z� renkte �iz
plot(x, y2)

% Legend, �izilen grafiklerin neyi temsil etti�ini belirtir
legend('sin', 'cos')

% hold off komutu, hold on'un etkisini kald�rarak bir sonraki �izimi haz�rlar
hold off