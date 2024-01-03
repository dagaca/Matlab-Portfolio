% Bu �al��mada, Matlab kodu arac�l���yla �ift Yanband Genlik Mod�lasyonu - 
% K�sa Ta��y�c� (�YBGM-KT) sinyalleri incelendi. �lk olarak, verilen 
% sinyallerin grafi�i �izildi ve grafiklere uygun ba�l�klar eklendi. 
% Bu sinyaller, bir giri� (mesaj) sinyali, bir ta��y�c� sinyal ve 
% mod�le edilmi� ��k�� sinyali i�eriyordu. Daha sonra, giri�, ta��y�c� ve 
% ��k�� sinyallerinin eksen d�zenli genlik spektrumlar�n� ��karmak i�in 
% fft ve di�er fonksiyonlar� kullan�ld�. Elde etti�imiz genlik ve faz 
% spektrumlar�n� tek bir figure �zerinde �izildi.
%% 1a) Cift Yanband Genlik Modulasyonu-Kisa Tasiyici (CYBGM-KT) ve Yorumlanmasi
% Fs : Isareti MATLAB ortaminda analog gibi islemek icin
% kullanilan ornekleme frekansi (Fc'nin 100 kati)
% Fc : Tasiyicinin frekansi

close all,clear all,clc
Fs = 5000; 
Ts = 1/Fs;
Fc = 50;
A = 1;
t = -1:Ts:1;

input = A*exp(-5*t.^2); % bilgi isareti
carrier = A*cos(2*pi*Fc*t); % tasiyici
output = (input.*carrier);

figure(1),
subplot(311),plot(t,input),title('Giris(Mesaj) Isareti'),grid on
xlabel('Zaman [sn]'),ylabel('Genlik [V]')
subplot(312),plot(t,carrier),title('Tasiyici Isaret'),grid on
xlabel('Zaman [sn]'),ylabel('Genlik [V]')
subplot(313),plot(t,output),title('Moduleli Isaret'),grid on
xlabel('Zaman [sn]'),ylabel('Genlik [V]')

%% 1b) Cift Yanband Isaretinin (DSB) Frekans Analizi
X1 = fft(input);
mag_X1 = fftshift(abs(X1)); % merkeze kayd�rma
mag_X1 = 1/numel(mag_X1)*mag_X1; % olcekleme
F = linspace(-Fs/2,Fs/2,numel(mag_X1));

X2 = fft(carrier);
mag_X2 = fftshift(abs(X2)); % merkeze kayd�rma
mag_X2 = 1/numel(mag_X2)*mag_X2; % olcekleme
F = linspace(-Fs/2,Fs/2,numel(mag_X2));

X3 = fft(output);
mag_X3 = fftshift(abs(X3)); % merkeze kayd�rma
mag_X3 = 1/numel(mag_X3)*mag_X3; % olcekleme
F = linspace(-Fs/2,Fs/2,numel(mag_X3));

figure(2), 
subplot(311);plot(F,mag_X1);xlim([-60 , 60]);grid on
title('Giris Isaretinin Genlik Spekt.');xlabel('Frekans [Hz]');ylabel('Genlik [V]')
subplot(312);plot(F,mag_X2);xlim([-60 , 60]);grid on
title('Tasiyici Isaretin Genlik Spekt.');xlabel('Frekans [Hz]');ylabel('Genlik [V]')
subplot(313);plot(F,mag_X3);xlim([-60 , 60]);grid on
title('Moduleli Isaretin Genlik Spekt.');xlabel('Frekans [Hz]');ylabel('Genlik [V]')