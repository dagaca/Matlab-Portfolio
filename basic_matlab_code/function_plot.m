%% function plot
% f(x) = 3x^2 - 5x - 6 fonksiyonu [-56,64] aral���nda �izdirilmi�tir.
% x de�erlerini belirli bir aral�kta olu�tur ([-56, 64])
x = [-56:64];

% Verilen fonksiyon f(x) = 3x^2 - 5x - 6' y� hesapla
y = 3*(x.^2) - 5*x - 6;

% x ve y de�erlerini kullanarak bir grafik �iz
plot(x, y)

% Grafi�i daha iyi g�rebilmek i�in grid ekleyin
grid on

% X ekseni etiketi
xlabel('x')

% Y ekseni etiketi
ylabel('f(x)')

% Grafik ba�l���
title('f(x) = 3x^2 - 5x - 6 Fonksiyonu')

% Grafik penceresindeki i�levi daha iyi anlamak i�in birka� ek ayar
axis([-60, 70, -5000, 10000])

% Girdi ve ��k��lar aras�ndaki ili�kiyi daha belirgin hale getirmek i�in bir �izgi ekleyin
line([0, 0], ylim, 'Color', 'k', 'LineWidth', 1.5, 'LineStyle', '--')

% Negatif x ekseni �zerindeki de�erlere vurgu yapmak i�in bir �izgi ekleyin
line(xlim, [0, 0], 'Color', 'k', 'LineWidth', 1.5, 'LineStyle', '--')