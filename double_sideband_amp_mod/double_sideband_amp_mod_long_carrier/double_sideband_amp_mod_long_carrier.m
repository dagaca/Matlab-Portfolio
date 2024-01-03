% Bu �al��mada, Matlab kodu arac�l���yla �ift Yanband Genlik Mod�lasyonu - 
% Uzun Ta��y�c� (�YBGM-UT) sinyalleri incelendi. 
% �lk olarak, verilen sinyallerin grafiklerini �izdik ve 
% her bir grafi�e uygun ba�l�klar eklendi. Bu sinyaller, 
% bir mesaj sinyali, bir ta��y�c� sinyal ve mod�le edilmi� 
% ��k�� sinyali i�eriyordu. Daha sonra, farkl� mod�lasyon indeksleri 
% (ma de�erleri i�in [0.1, 0.5, 3]) kullan�larak 
% s_am = (1 + ma*input).*carrier komut sat�r�nda bulunan kod �al��t�r�ld� 
% ve elde etti�imiz sonu�lar g�zlemlendi. Ard�ndan, giri�, ta��y�c� 
% ve ��k�� sinyallerinin genlik spektrumlar�n� ��karmak i�in fft ve 
% di�er ilgili fonksiyonlar kullan�ld�. Elde edilen genlik ve 
% faz spektrumlar� tek bir figure �zerinde birle�tirilip 
% d�zenlenerek �izildi. Deneyin temel amac�, mod�lasyonun 
% genel prensiplerini anlamak ve verilen sinyallerin 
% genlik spektrumlar�n� analiz etmekti.
% 
% Yorumlamalar:
% ?	ma = 1 i�in, tam mod�leli sinyal �ekli g�zlemlenir.
% ?	ma = 0.1 ve ma = 0.5 i�in, tam mod�le olmam�� bir 
% sinyal �ekli g�zlemlenir.
% ?	ma = 3 i�in, a��r� mod�leli sinyal �ekli g�zlemlenir.
%% 2a) Tasiyicili Genlik Modulasyonu (AM) ve Yorumlanmasi
close all,clear all,clc
Fs = 5000; Ts = 1/Fs;
Fc = 100; % tasiyici frekans - Hz
Fm = 10;
t = -1:Ts:1;
A = 1; 
ma = 1; % ma parametresi [0.1,0.5,3] i�in �al��t�ralacakt�r.
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
ma = 1; % ma = 1 i�in �al��t�ralacakt�r.

input = A*cos(2*pi*Fm*t); % bilgi isareti
carrier = cos(2*pi*Fc*t); % tasiyici
s_am = (1 + ma*input).*carrier;

X1 = fft(input);
mag_X1 = fftshift(abs(X1)); % merkeze kayd�rma
mag_X1 = 1/numel(mag_X1)*mag_X1; % olcekleme
F = linspace(-Fs/2,Fs/2,numel(mag_X1));

X2 = fft(carrier);
mag_X2 = fftshift(abs(X2)); % merkeze kayd�rma
mag_X2 = 1/numel(mag_X2)*mag_X2; % olcekleme
F = linspace(-Fs/2,Fs/2,numel(mag_X2));

X3 = fft(s_am);
mag_X3 = fftshift(abs(X3)); % merkeze kayd�rma
mag_X3 = 1/numel(mag_X3)*mag_X3; % olcekleme
F = linspace(-Fs/2,Fs/2,numel(mag_X3));

figure(2), 
subplot(311);plot(F,mag_X1);xlim([-3*Fc , 3*Fc]);grid on
title('Giris Isaretinin Genlik Spekt.');xlabel('Frekans [Hz]');ylabel('Genlik [V]')
subplot(312);plot(F,mag_X2);xlim([-3*Fc , 3*Fc]);grid on
title('Tasiyici Isaretin Genlik Spekt.');xlabel('Frekans [Hz]');ylabel('Genlik [V]')
subplot(313);plot(F,mag_X3);xlim([-3*Fc , 3*Fc]);grid on
title('Moduleli Isaretin Genlik Spekt.');xlabel('Frekans [Hz]');ylabel('Genlik [V]')