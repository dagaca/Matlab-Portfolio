clear all;
close all;
clc;

% Kondansat�r ve diren� de�erleri
c = 10e-6;   % Kondansat�r kapasitans� (Farad)
r1 = 1e3;    % Diren� 1 (Ohm)
r2 = 10e3;   % Diren� 2 (Ohm)
r3 = 0.1e3;  % Diren� 3 (Ohm)

% Zaman sabitlerinin hesaplanmas�
tau1 = c * r1;
tau2 = c * r2;
tau3 = c * r3;

% Zaman aral���n�n belirlenmesi
t = 0:0.002:1;

% Voltaj de�erlerinin hesaplanmas�
v1 = 10 * (1 - exp(-t / tau1));
v2 = 10 * (1 - exp(-t / tau2));
v3 = 10 * (1 - exp(-t / tau3));

% Grafik �izimi
plot(t, v1, 'r--', t, v2, 'b:', t, v3, 'g-.', 'linewidth', 2)
axis([0 1.02 0 12]) % Eksen s�n�rlar�n� belirleme
title('�� zaman sabitiyle bir kapasit�r�n �arj edilmesi')
xlabel('Zaman [sn]')
ylabel('Voltaj [V]')
legend('R = 1K ohm', 'R = 10K ohm', 'R = 0.1K ohm')

% Maksimum voltaj de�erini bulma ve ekrana yazd�rma
[maxV, idx] = max(v1);
maxV_time = t(idx);
fprintf('Maksimum voltaj %8.2fV de�erine %8.2f saniyede ula��r.\n', maxV, maxV_time);