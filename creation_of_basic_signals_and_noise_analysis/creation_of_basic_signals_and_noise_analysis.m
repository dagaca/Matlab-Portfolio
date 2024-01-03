% Bu MATLAB kodu, belirli bir matematiksel form�l kullan�larak 
% �retilen temel i�aretlerin olu�turulmas�n� ve bu i�aretlere 
% belirli bir sinyal-g�r�lt� oran� ile g�r�lt� eklenmesini i�erir. 
% Elde edilen i�aretler, alt� ayr� alt grafik penceresinde 
% s�ras�yla g�sterilir. Giri� i�areti ve g�r�lt�l� i�aretin genel g�r�n�m�, 
% i�aretin nas�l olu�turuldu�unu ve g�r�lt� eklemenin etkilerini g�sterir.
% 
% 
% Teorik:
% x(t) = 3.2�cos(2?0.25�t)?2.1�square(2?2�t)+5.3�sin(2?0.5�t+?/17) 
% olarak verildi�inde 
% Fs = 100 ve t? [?5, 5] 
% aral���ndaki i�aretimiz i�in:
%% S3A ve S3B
clear all; close all; clc;
fs = 100; % �rnekleme frekans� 100'd�r.
t = -5:1/fs:5; % Zaman� -5'ten 5'e 1/100 artarak gider.
% Bize verilen x(t) sinyali x1,x2,x3 olmak �zere 3 sinyalden olu�maktad�r.
x1 = 3.2*cos(0.5*pi*t); % x1 sinyali
x2 = 2.1*square(4*pi*t); % x2 sinyali
x3 = 5.3*sin(pi*t + pi/17); % x3 sinyali
x = x1 - x2 + x3; % x(t) sinyali
y = awgn(x,5,'measured'); % x(t) sinyalinin g�c�n� �l��p �zerine 5dB g�r�lt� eklenir.
subplot(5,1,1);
plot(t,x1,'m');
title('x1(t) ��areti')
xlabel('Zaman [sn]')
ylabel('Genlik [V]')
grid on;
subplot(5,1,2);
plot(t,x2,'g');
title('x2(t) ��areti')
xlabel('Zaman [sn]')
ylabel('Genlik [V]')
grid on;
subplot(5,1,3);
plot(t,x3);
title('x3(t) ��areti')
xlabel('Zaman [sn]')
ylabel('Genlik [V]')
xlim([0 0.05]); % Sadece 3. �eklin x eksenini 0 ile 0.05 aras�nda s�n�rland�rd�k.
grid on;
subplot(5,1,4);
plot(t,x,'b');
title('Giri� ��areti')
xlabel('Zaman [sn]')
ylabel('Genlik [V]')
grid on;
subplot(5,1,5);
plot(t,y,'r');
title('G�r�lt�l� ��aret')
xlabel('Zaman [sn]')
ylabel('Genlik [V]')
grid on;