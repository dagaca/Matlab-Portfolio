%% function plot
% f(x) = 3x^2 - 5x - 6 fonksiyonu [-56,64] aralýðýnda çizdirilmiþtir.
% x deðerlerini belirli bir aralýkta oluþtur ([-56, 64])
x = [-56:64];

% Verilen fonksiyon f(x) = 3x^2 - 5x - 6' yý hesapla
y = 3*(x.^2) - 5*x - 6;

% x ve y deðerlerini kullanarak bir grafik çiz
plot(x, y)

% Grafiði daha iyi görebilmek için grid ekleyin
grid on

% X ekseni etiketi
xlabel('x')

% Y ekseni etiketi
ylabel('f(x)')

% Grafik baþlýðý
title('f(x) = 3x^2 - 5x - 6 Fonksiyonu')

% Grafik penceresindeki iþlevi daha iyi anlamak için birkaç ek ayar
axis([-60, 70, -5000, 10000])

% Girdi ve çýkýþlar arasýndaki iliþkiyi daha belirgin hale getirmek için bir çizgi ekleyin
line([0, 0], ylim, 'Color', 'k', 'LineWidth', 1.5, 'LineStyle', '--')

% Negatif x ekseni üzerindeki deðerlere vurgu yapmak için bir çizgi ekleyin
line(xlim, [0, 0], 'Color', 'k', 'LineWidth', 1.5, 'LineStyle', '--')