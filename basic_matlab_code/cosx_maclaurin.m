% Bu MATLAB fonksiyonu, cos(x) trigonometrik fonksiyonunu 
% Maclaurin serisi kullanarak yakla��k bir �ekilde hesaplar. 
% Fonksiyon, belirli bir tolerans (tol) de�eri sa�lanana kadar 
% Maclaurin serisinin terimlerini kullanarak yakla��m� iyile�tirir. 
% 
% Fonksiyonun girdisi x ve tolerans tol de�erleridir. 
% Tolerans, serinin ne kadar geni�letilece�ini kontrol eder. 
% Daha k���k bir tolerans, daha hassas bir hesaplama sa�lar, 
% ancak daha fazla hesap maliyetine neden olabilir. 
% y ��k�� de�eri, cos(x) fonksiyonunun yakla��k de�erini i�erir.

function y = cosx_maclaurin(x,tol)
    % cos(x) fonksiyonunu Maclaurin serisi kullanarak yakla�t�r

    % x: Yakla�t�r�lacak noktan�n de�eri
    % tol: Tolerans de�eri, serinin ne kadar geni�letilece�ini kontrol eder

    y = 1;     % Ba�lang�� de�eri (k=0 terimi)
    t = 1;     % �lk terim
    k = 1;     % �terasyon sayac�

    % Toleransa ula��l�ncaya kadar devam et
    while (max(abs(t)) >= tol)
        t = t .* (-x.^2) ./ ((2*k) * (2*k-1));  % Maclaurin serisi terimi
        y = y + t;  % Seriyi g�ncelle
        k = k + 1;  % �terasyon sayac�n� art�r
    end
end