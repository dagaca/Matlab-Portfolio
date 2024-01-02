%% 2a) Tasiyicili Genlik Modulasyonu (AM) ve Yorumlanmasi
close all,clear all,clc
Fs = 5000; Ts = 1/Fs;
Fc = 100; % tasiyici frekans - Hz
Fm = 10;
t = -1:Ts:1;
A = 1; 
ma = 1; % ma parametresi [0.1,0.5,3] için çalýþtýralacaktýr.
input = A*cos(2*pi*Fm*t); % bilgi isareti
carrier = cos(2*pi*Fc*t); % tasiyici
s_am = (1 + ma*input).*carrier;
figure(1),
subplot(311),plot(t,input),title('Mesaj Isareti'),grid on
xlabel('Zaman [sn]'),ylabel('Genlik [V]')
subplot(312),plot(t,carrier),title('Tasiyici Isaret'),grid on
xlabel('Zaman [sn]'),ylabel('Genlik [V]')
subplot(313),plot(t, s_am),title('Moduleli Isaret'),grid on
xlabel('Zaman [sn]'),ylabel('Genlik [V]'),xlim([-0.5 0.5])
%% 2c) Fourier Analizi
Fs = 5000; Ts = 1/Fs;
Fc = 100; % tasiyici frekans - Hz
Fm = 10;
t = -1:Ts:1;
A = 1; 
ma = 1; % ma = 1 için çalýþtýralacaktýr.

input = A*cos(2*pi*Fm*t); % bilgi isareti
carrier = cos(2*pi*Fc*t); % tasiyici
s_am = (1 + ma*input).*carrier;

X1 = fft(input);
mag_X1 = fftshift(abs(X1)); % merkeze kaydýrma
mag_X1 = 1/numel(mag_X1)*mag_X1; % olcekleme
F = linspace(-Fs/2,Fs/2,numel(mag_X1));

X2 = fft(carrier);
mag_X2 = fftshift(abs(X2)); % merkeze kaydýrma
mag_X2 = 1/numel(mag_X2)*mag_X2; % olcekleme
F = linspace(-Fs/2,Fs/2,numel(mag_X2));

X3 = fft(s_am);
mag_X3 = fftshift(abs(X3)); % merkeze kaydýrma
mag_X3 = 1/numel(mag_X3)*mag_X3; % olcekleme
F = linspace(-Fs/2,Fs/2,numel(mag_X3));

figure(2), 
subplot(311);plot(F,mag_X1);xlim([-3*Fc , 3*Fc]);grid on
title('Giris Isaretinin Genlik Spekt.');xlabel('Frekans [Hz]');ylabel('Genlik [V]')
subplot(312);plot(F,mag_X2);xlim([-3*Fc , 3*Fc]);grid on
title('Tasiyici Isaretin Genlik Spekt.');xlabel('Frekans [Hz]');ylabel('Genlik [V]')
subplot(313);plot(F,mag_X3);xlim([-3*Fc , 3*Fc]);grid on
title('Moduleli Isaretin Genlik Spekt.');xlabel('Frekans [Hz]');ylabel('Genlik [V]')