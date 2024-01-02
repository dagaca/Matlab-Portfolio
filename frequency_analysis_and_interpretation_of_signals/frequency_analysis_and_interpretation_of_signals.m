%% 1a: Gauss i�areti olu�turma
clear all; close all; clc;

fs = 1e3;       % �rnekleme frekans�
ts = 1/fs;      % �rnekleme periyodu
sgm = 1;        % Standart sapma
a = 4 * sgm;    % Geni�lik

g = @(t) (1 / sqrt(2*pi) * sgm) * exp(-t.^2 / (2 * sgm^2)); % Gauss i�areti
t = -a:ts:a;    % Zaman aral���

figure; % Yeni bir figure a�
subplot(211)
plot(t, g(t))
grid on
title('Gauss ��areti')
xlabel('Zaman [sn]')
ylabel('Genlik [V]')

%% 1b: Analitik t�rev
g_ussu = @(t) (-t / (sgm^3 * sqrt(2*pi))) .* exp(-t.^2 / (2 * sgm^2));

%% 1c: Gauss i�aretinin t�retilmesi ve kar��la�t�rma
x = g(t);
z = conv(x, [1 -1], 'same') / ts; % conv ile x'in t�revini ald�k.

subplot(212)
plot(t, z, '-r', 'linewidth', 2); hold on;
plot(t, g_ussu(t), '--b', 'linewidth', 2)
grid on
title('Gauss ��aretinin T�revleri: K�rm�z� - conv ile t�rev, Mavi - analitik t�rev')
xlabel('Zaman [sn]')
ylabel('Genlik [V]')

%% 1d: T�revin genlik ve faz spektrumlar�
X = fft(g_ussu(t));
mag_X = fftshift(abs(X)); % Merkeze kayd�rma
phs_X = fftshift(angle(X));
F = linspace(-fs/2, fs/2, numel(mag_X));

figure; % Yeni bir figure daha a�
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

suptitle('Gauss ��aretinin T�revine Ait Genlik ve Faz Spektrumlar�')