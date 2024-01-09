% "power_distribution.png" dosyas�nda yer alan devre �emas�ndaki  
% RL 0 dan 50K ohm a kadar de�i�mektedir. Matlab kodu, RL �zerinde 
% ger�ekle�tirilen g�� da��l�m�n� modellemektedir.
% Bu kod, RL (y�k direnci) de�erlerini de�i�tirerek devrede harcanan g�c� 
% modelleyen bir grafik �izer. Ayr�ca, g�� t�revinin negatiften pozitife 
% ge�ti�i noktalar� belirleyerek, maksimum g�c�n hangi RL de�erinde elde 
% edildi�ini bulur. Sonu�lar ekrana yazd�r�l�r ve RL �zerinde harcanan 
% g�� grafi�i �izilir.

clear all;
close all;
clc;

% Devre parametreleri
vs = 10;     % Kaynak gerilimi (V)
rs = 10e3;   % Kaynak direnci (Ohm)
rl = 0:1e3:50e3; % Y�k direnci aral��� (0 Ohm'dan 50k Ohm'a kadar, 1k Ohm art��)

% Y�k direnci say�s�n�n belirlenmesi
k = length(rl);

% G�� da��l�m�n�n hesaplanmas�
for i = 1:k
    pl(i) = (vs^2 * rl(i)) / ((rs + rl(i))^2);
end

% G�� t�revinin hesaplanmas� (geriye d�n�k fark kullan�larak)
dp = diff(pl) ./ diff(rl);
rld = rl(2:length(rl)); % G�� t�reviden 1 �nceki diren� de�erini al�r

% G�� t�revinin kritik noktalar�n�n belirlenmesi
prod = dp(1:length(dp) - 1) .* dp(2:length(dp));
power_res = rld(prod < 0); % G�� t�revi negatifden pozitife ge�i� noktalar�

% Maksimum g�� de�eri ve bu de�erin oldu�u RL de�eri
[max_power, idx] = max(pl);
max_power_res = rl(idx);

% Sonu�lar� ekrana yazd�rma
fprintf('Maksimum g�� %8.4f Ohmda olu�ur\n', max_power_res)
fprintf('Maksimum g�� kayb� %8.4f Wattd�r\n', max_power)

% Grafi�i �izme
figure;
plot(rl, pl, '-', 'linewidth', 2)
hold on
plot(max_power_res, max_power, 'ro', 'MarkerSize', 10) % Maksimum g�� noktas�n� g�sterir
title('RL �zerinde harcanan g��')
xlabel('Ohm cinsinden y�k direnci')
ylabel('Watt cinsinden g��')
legend('G�� Da��l�m�', 'Maksimum G�� Noktas�')