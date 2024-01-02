%% 1a: Gauss iþareti oluþturma
clear all; close all; clc;

fs = 1e3;       % Örnekleme frekansý
ts = 1/fs;      % Örnekleme periyodu
sgm = 1;        % Standart sapma
a = 4 * sgm;    % Geniþlik

g = @(t) (1 / sqrt(2*pi) * sgm) * exp(-t.^2 / (2 * sgm^2)); % Gauss iþareti
t = -a:ts:a;    % Zaman aralýðý

figure; % Yeni bir figure aç
subplot(211)
plot(t, g(t))
grid on
title('Gauss Ýþareti')
xlabel('Zaman [sn]')
ylabel('Genlik [V]')

%% 1b: Analitik türev
g_ussu = @(t) (-t / (sgm^3 * sqrt(2*pi))) .* exp(-t.^2 / (2 * sgm^2));

%% 1c: Gauss iþaretinin türetilmesi ve karþýlaþtýrma
x = g(t);
z = conv(x, [1 -1], 'same') / ts; % conv ile x'in türevini aldýk.

subplot(212)
plot(t, z, '-r', 'linewidth', 2); hold on;
plot(t, g_ussu(t), '--b', 'linewidth', 2)
grid on
title('Gauss Ýþaretinin Türevleri: Kýrmýzý - conv ile türev, Mavi - analitik türev')
xlabel('Zaman [sn]')
ylabel('Genlik [V]')

%% 1d: Türevin genlik ve faz spektrumlarý
X = fft(g_ussu(t));
mag_X = fftshift(abs(X)); % Merkeze kaydýrma
phs_X = fftshift(angle(X));
F = linspace(-fs/2, fs/2, numel(mag_X));

figure; % Yeni bir figure daha aç
subplot(211)
plot(F, mag_X)
title('Genlik Spektrumu')
xlabel('Frekans [Hz]')
ylabel('Genlik [V]')
grid on
xlim([-2 2])

subplot(212)
plot(F, phs_X)
title('Faz Spektrumu')
xlabel('Frekans [Hz]')
ylabel('Faz [rad]')
grid on
xlim([-2 2])

suptitle('Gauss Ýþaretinin Türevine Ait Genlik ve Faz Spektrumlarý')