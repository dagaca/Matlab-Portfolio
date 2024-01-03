% Bu MATLAB fonksiyonu, cos(x) trigonometrik fonksiyonunu 
% Maclaurin serisi kullanarak yaklaþýk bir þekilde hesaplar. 
% Fonksiyon, belirli bir tolerans (tol) deðeri saðlanana kadar 
% Maclaurin serisinin terimlerini kullanarak yaklaþýmý iyileþtirir. 
% 
% Fonksiyonun girdisi x ve tolerans tol deðerleridir. 
% Tolerans, serinin ne kadar geniþletileceðini kontrol eder. 
% Daha küçük bir tolerans, daha hassas bir hesaplama saðlar, 
% ancak daha fazla hesap maliyetine neden olabilir. 
% y çýkýþ deðeri, cos(x) fonksiyonunun yaklaþýk deðerini içerir.

function y = cosx_maclaurin(x,tol)
    % cos(x) fonksiyonunu Maclaurin serisi kullanarak yaklaþtýr

    % x: Yaklaþtýrýlacak noktanýn deðeri
    % tol: Tolerans deðeri, serinin ne kadar geniþletileceðini kontrol eder

    y = 1;     % Baþlangýç deðeri (k=0 terimi)
    t = 1;     % Ýlk terim
    k = 1;     % Ýterasyon sayacý

    % Toleransa ulaþýlýncaya kadar devam et
    while (max(abs(t)) >= tol)
        t = t .* (-x.^2) ./ ((2*k) * (2*k-1));  % Maclaurin serisi terimi
        y = y + t;  % Seriyi güncelle
        k = k + 1;  % Ýterasyon sayacýný artýr
    end
end