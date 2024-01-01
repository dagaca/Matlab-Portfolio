function [t, maclaurin, arcsin] = arcsin_maclaurin_comparison()
    % Kullan�c�dan Lx de�erini girmesini ister
    Lx = input('Lx degerini giriniz: ');
    % Belirtilen aral�kta bir x vekt�r� olu�turur
    x = -Lx:0.00001:Lx;
    % Hesaplama tolerans�n� belirler
    tol = 1e-5;

    % calculate_arcsin_maclaurin fonksiyonunu �a��rarak hesaplamalar� yapar
    [t, maclaurin, arcsin] = calculate_arcsin_maclaurin(x, tol);

    % Sonu�lar� grafik �zerinde �izer
    plot(t, maclaurin, '-r', 'LineWidth', 2);
    hold on
    plot(t, arcsin, '--b', 'LineWidth', 2);
    % Grafi�e renkli �izgiler ekler ve bir legend olu�turur
    legend('Maclaurin', 'arcsin');
end

function [t, maclaurin, arcsin] = calculate_arcsin_maclaurin(x, tol)
    % Giri� vekt�r�n� ��k�� vekt�rleriyle e�le�tirir
    t = x;
    maclaurin = zeros(size(x));
    arcsin = zeros(size(x));

    % Her bir x de�eri i�in i�lemleri ger�ekle�tirir
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

        % Hesaplanan de�erleri vekt�rlere atar
        maclaurin(i) = ans;
        arcsin(i) = asin(x(i));
    end
end