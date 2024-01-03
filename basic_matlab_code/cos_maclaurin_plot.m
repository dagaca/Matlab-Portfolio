% Bu MATLAB fonksiyonu, kullan�c�n�n belirledi�i aral�kta 
% cos(x) fonksiyonunu hem Maclaurin serisi kullanarak 
% yakla�t�rarak hem de ger�ek cos(x) fonksiyonu ile 
% kar��la�t�rarak bir grafik �izer.
% Bu fonksiyon, cosx_maclaurin adl� ba�ka bir fonksiyonu 
% kullanarak Maclaurin serisi ile cos(x) fonksiyonunu 
% yakla�t�r�r ve bu yakla��m� ger�ek cos(x) fonksiyonu 
% ile kar��la�t�rarak bir grafik �izer.
% 
% Lx: x de�erlerinin geni�li�ini belirler.
% res: grafik ��z�n�rl���n� belirler.
% tol: Maclaurin serisi i�in kullan�lan fonksiyonun 
% tolerans de�erini belirler.
% 
% Grafikte k�rm�z� noktal� �izgi Maclaurin serisi ile 
% yakla��lan cos(x) fonksiyonunu temsil eder, mavi kesikli 
% �izgi ise ger�ek cos(x) fonksiyonunu temsil eder. 
% Grafikteki benzerlik veya farkl�l�klar� g�zlemleyerek, 
% Maclaurin serisinin belirli bir tolerans d�zeyinde 
% ne kadar do�ru bir yakla��m sa�lad���n� de�erlendirebilirsiniz.

function cos_maclaurin_plot(Lx, res, tol)
    % cos(x) fonksiyonunu Maclaurin serisi ile yakla�t�rarak ve ger�ek cos(x) ile kar��la�t�rarak grafik �iz
    
    % Lx: x de�erlerinin geni�li�i
    % res: grafik ��z�n�rl���
    % tol: cosx_maclaurin fonksiyonu i�in tolerans de�eri

    % x de�erlerini belirtilen geni�likte ve ��z�n�rl�kte olu�tur
    xx = linspace(-Lx, Lx, res);

    % cosx_maclaurin fonksiyonunu �a��rarak yakla��k de�erleri hesapla
    yy_approx = cosx_maclaurin(xx, tol);

    % Ger�ek cos(x) de�erlerini hesapla
    yy_actual = cos(xx);

    % Maclaurin Serisi ile Yakla��k De�erleri K�rm�z� Noktal� �izgiyle �iz
    plot(xx, yy_approx, 'r:', 'linewidth', 2);
    hold on

    % Ger�ek cos(x) De�erleri Mavi Kesikli �izgi ile �iz
    plot(xx, yy_actual, 'b--', 'linewidth', 2);

    % Grafik d�zenlemeleri
    grid;
    legend('Maclaurin Yakla��m�', 'Ger�ek cos(x)');
    xlabel('x');
    ylabel('cos(x)');
    title('cos(x) Fonksiyonu ve Maclaurin Serisi Yakla��m�');

    % Grafikleri birle�tir
    hold off
end