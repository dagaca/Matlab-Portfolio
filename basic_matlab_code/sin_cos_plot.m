%% sin-cos plot
% sin ve cos bir arada çizdirilmiþtir.
clear all;close all;clc

% 0 ile 2*pi arasýnda 100 adet nokta üreten x vektörü oluþtur
x = 0:pi/100:2*pi;

% sin(x) fonksiyonunu hesapla
y = sin(x);

% sin(x) fonksiyonunu mavi renkte çiz
plot(x, y)

% hold on komutu, bir grafik üzerine baþka bir grafik eklemek için kullanýlýr
hold on

% cos(x) fonksiyonunu hesapla
y2 = cos(x);

% cos(x) fonksiyonunu kýrmýzý renkte çiz
plot(x, y2)

% Legend, çizilen grafiklerin neyi temsil ettiðini belirtir
legend('sin', 'cos')

% hold off komutu, hold on'un etkisini kaldýrarak bir sonraki çizimi hazýrlar
hold off