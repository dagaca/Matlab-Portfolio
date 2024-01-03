% Bu çalýþma, matematikte Maclaurin serilerinin trigonometrik fonksiyonlarý 
% yaklaþtýrmak için nasýl kullanýlabileceðini anlamak ve bu yaklaþýmýn 
% ne kadar doðru olduðunu deðerlendirmek amacýný taþýmaktadýr.
% 
% Ýlk olarak, calculate_arcsin_maclaurin fonksiyonu, 
% kullanýcýnýn belirttiði x vektörü ve tolerans deðeri ile arcsin(x) 
% fonksiyonunun Maclaurin serisini hesaplar. Bu hesaplama, 
% seriyi iteratif olarak geniþleterek gerçek arcsin(x) 
% fonksiyonuna yaklaþtýrma iþlemidir.
% 
% Daha sonra, arcsin_maclaurin_comparison fonksiyonu, 
% kullanýcýdan belirli bir Lx aralýðýný girmesini ister ve 
% bu aralýkta bir x vektörü oluþturur. Ardýndan, hesaplanan 
% Maclaurin serisi ve gerçek arcsin(x) fonksiyonu bu x deðerleri 
% üzerinde karþýlaþtýrýlarak bir grafik çizilir. Bu grafik, 
% Maclaurin serisinin gerçek fonksiyona ne kadar iyi bir 
% yaklaþým saðladýðýný görsel olarak gösterir.

function [t, maclaurin, arcsin] = arcsin_maclaurin_comparison()
    % Kullanýcýdan Lx deðerini girmesini ister
    Lx = input('Lx degerini giriniz: ');
    % Belirtilen aralýkta bir x vektörü oluþturur
    x = -Lx:0.00001:Lx;
    % Hesaplama toleransýný belirler
    tol = 1e-5;

    % calculate_arcsin_maclaurin fonksiyonunu çaðýrarak hesaplamalarý yapar
    [t, maclaurin, arcsin] = calculate_arcsin_maclaurin(x, tol);

    % Sonuçlarý grafik üzerinde çizer
    plot(t, maclaurin, '-r', 'LineWidth', 2);
    hold on
    plot(t, arcsin, '--b', 'LineWidth', 2);
    % Grafiðe renkli çizgiler ekler ve bir legend oluþturur
    legend('Maclaurin', 'arcsin');
end

function [t, maclaurin, arcsin] = calculate_arcsin_maclaurin(x, tol)
    % Giriþ vektörünü çýkýþ vektörleriyle eþleþtirir
    t = x;
    maclaurin = zeros(size(x));
    arcsin = zeros(size(x));

    % Her bir x deðeri için iþlemleri gerçekleþtirir
    for i = 1:length(x)
        n = 0;
        ans = 0;
        dummy = 1;

        % Maclaurin serisini hesaplar
        while max(dummy) > tol
            ans = ans + ((factorial(2*n) * (x(i)^((2*n) + 1))) / ...
                          (((2^n) * factorial(n))^2 * (2*n + 1)));
            dummy = abs(asin(x(i)) - ans);
            n = n + 1;
        end

        % Hesaplanan deðerleri vektörlere atar
        maclaurin(i) = ans;
        arcsin(i) = asin(x(i));
    end
end