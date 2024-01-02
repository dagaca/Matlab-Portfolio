%% S3A ve S3B
clear all; close all; clc;
fs = 100; % Örnekleme frekansý 100'dür.
t = -5:1/fs:5; % Zamaný -5'ten 5'e 1/100 artarak gider.
% Bize verilen x(t) sinyali x1,x2,x3 olmak üzere 3 sinyalden oluþmaktadýr.
x1 = 3.2*cos(0.5*pi*t); % x1 sinyali
x2 = 2.1*square(4*pi*t); % x2 sinyali
x3 = 5.3*sin(pi*t + pi/17); % x3 sinyali
x = x1 - x2 + x3; % x(t) sinyali
y = awgn(x,5,'measured'); % x(t) sinyalinin gücünü ölçüp üzerine 5dB gürültü eklenir.
subplot(5,1,1);
plot(t,x1,'m');
title('x1(t) Ýþareti')
xlabel('Zaman [sn]')
ylabel('Genlik [V]')
grid on;
subplot(5,1,2);
plot(t,x2,'g');
title('x2(t) Ýþareti')
xlabel('Zaman [sn]')
ylabel('Genlik [V]')
grid on;
subplot(5,1,3);
plot(t,x3);
title('x3(t) Ýþareti')
xlabel('Zaman [sn]')
ylabel('Genlik [V]')
xlim([0 0.05]); % Sadece 3. þeklin x eksenini 0 ile 0.05 arasýnda sýnýrlandýrdýk.
grid on;
subplot(5,1,4);
plot(t,x,'b');
title('Giriþ Ýþareti')
xlabel('Zaman [sn]')
ylabel('Genlik [V]')
grid on;
subplot(5,1,5);
plot(t,y,'r');
title('Gürültülü Ýþaret')
xlabel('Zaman [sn]')
ylabel('Genlik [V]')
grid on;