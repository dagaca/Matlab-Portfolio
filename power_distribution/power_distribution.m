% "power_distribution.png" dosyasýnda yer alan devre þemasýndaki  
% RL 0 dan 50K ohm a kadar deðiþmektedir. Matlab kodu, RL üzerinde 
% gerçekleþtirilen güç daðýlýmýný modellemektedir.
% Bu kod, RL (yük direnci) deðerlerini deðiþtirerek devrede harcanan gücü 
% modelleyen bir grafik çizer. Ayrýca, güç türevinin negatiften pozitife 
% geçtiði noktalarý belirleyerek, maksimum gücün hangi RL deðerinde elde 
% edildiðini bulur. Sonuçlar ekrana yazdýrýlýr ve RL üzerinde harcanan 
% güç grafiði çizilir.

clear all;
close all;
clc;

% Devre parametreleri
vs = 10;     % Kaynak gerilimi (V)
rs = 10e3;   % Kaynak direnci (Ohm)
rl = 0:1e3:50e3; % Yük direnci aralýðý (0 Ohm'dan 50k Ohm'a kadar, 1k Ohm artýþ)

% Yük direnci sayýsýnýn belirlenmesi
k = length(rl);

% Güç daðýlýmýnýn hesaplanmasý
for i = 1:k
    pl(i) = (vs^2 * rl(i)) / ((rs + rl(i))^2);
end

% Güç türevinin hesaplanmasý (geriye dönük fark kullanýlarak)
dp = diff(pl) ./ diff(rl);
rld = rl(2:length(rl)); % Güç türeviden 1 önceki direnç deðerini alýr

% Güç türevinin kritik noktalarýnýn belirlenmesi
prod = dp(1:length(dp) - 1) .* dp(2:length(dp));
power_res = rld(prod < 0); % Güç türevi negatifden pozitife geçiþ noktalarý

% Maksimum güç deðeri ve bu deðerin olduðu RL deðeri
[max_power, idx] = max(pl);
max_power_res = rl(idx);

% Sonuçlarý ekrana yazdýrma
fprintf('Maksimum güç %8.4f Ohmda oluþur\n', max_power_res)
fprintf('Maksimum güç kaybý %8.4f Wattdýr\n', max_power)

% Grafiði çizme
figure;
plot(rl, pl, '-', 'linewidth', 2)
hold on
plot(max_power_res, max_power, 'ro', 'MarkerSize', 10) % Maksimum güç noktasýný gösterir
title('RL üzerinde harcanan güç')
xlabel('Ohm cinsinden yük direnci')
ylabel('Watt cinsinden güç')
legend('Güç Daðýlýmý', 'Maksimum Güç Noktasý')