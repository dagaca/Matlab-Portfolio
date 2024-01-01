function cos_maclaurin_plot(Lx, res, tol)
    % cos(x) fonksiyonunu Maclaurin serisi ile yaklaþtýrarak ve gerçek cos(x) ile karþýlaþtýrarak grafik çiz
    
    % Lx: x deðerlerinin geniþliði
    % res: grafik çözünürlüðü
    % tol: cosx_maclaurin fonksiyonu için tolerans deðeri

    % x deðerlerini belirtilen geniþlikte ve çözünürlükte oluþtur
    xx = linspace(-Lx, Lx, res);

    % cosx_maclaurin fonksiyonunu çaðýrarak yaklaþýk deðerleri hesapla
    yy_approx = cosx_maclaurin(xx, tol);

    % Gerçek cos(x) deðerlerini hesapla
    yy_actual = cos(xx);

    % Maclaurin Serisi ile Yaklaþýk Deðerleri Kýrmýzý Noktalý Çizgiyle Çiz
    plot(xx, yy_approx, 'r:', 'linewidth', 2);
    hold on

    % Gerçek cos(x) Deðerleri Mavi Kesikli Çizgi ile Çiz
    plot(xx, yy_actual, 'b--', 'linewidth', 2);

    % Grafik düzenlemeleri
    grid;
    legend('Maclaurin Yaklaþýmý', 'Gerçek cos(x)');
    xlabel('x');
    ylabel('cos(x)');
    title('cos(x) Fonksiyonu ve Maclaurin Serisi Yaklaþýmý');

    % Grafikleri birleþtir
    hold off
end