clear all;
close all;
clc;

% Kondansatör ve direnç deðerleri
c = 10e-6;   % Kondansatör kapasitansý (Farad)
r1 = 1e3;    % Direnç 1 (Ohm)
r2 = 10e3;   % Direnç 2 (Ohm)
r3 = 0.1e3;  % Direnç 3 (Ohm)

% Zaman sabitlerinin hesaplanmasý
tau1 = c * r1;
tau2 = c * r2;
tau3 = c * r3;

% Zaman aralýðýnýn belirlenmesi
t = 0:0.002:1;

% Voltaj deðerlerinin hesaplanmasý
v1 = 10 * (1 - exp(-t / tau1));
v2 = 10 * (1 - exp(-t / tau2));
v3 = 10 * (1 - exp(-t / tau3));

% Grafik çizimi
plot(t, v1, 'r--', t, v2, 'b:', t, v3, 'g-.', 'linewidth', 2)
axis([0 1.02 0 12]) % Eksen sýnýrlarýný belirleme
title('Üç zaman sabitiyle bir kapasitörün þarj edilmesi')
xlabel('Zaman [sn]')
ylabel('Voltaj [V]')
legend('R = 1K ohm', 'R = 10K ohm', 'R = 0.1K ohm')

% Maksimum voltaj deðerini bulma ve ekrana yazdýrma
[maxV, idx] = max(v1);
maxV_time = t(idx);
fprintf('Maksimum voltaj %8.2fV deðerine %8.2f saniyede ulaþýr.\n', maxV, maxV_time);