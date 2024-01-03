% Bu MATLAB kodu, farkl� frekans ve genliklere sahip cosinus 
% ve kare dalga formlar�n� �reterek bunlar� birle�tirir. 
% �� grafik, tek bir pencere i�inde s�ralanarak her biri i�in ba�l�k, 
% x-ekseni etiketi ve y-ekseni etiketi eklenir. Grafikler, 
% g�rsel d�zenlemelerle birlikte ayn� pencere i�inde g�sterilir. 
% Elde edilen sonu�lar, cosinus ve kare dalga formlar�n�n toplam�n� 
% ve bu sinyallerin zaman i�indeki de�i�imini g�sterir.
%% x1(t)
A = 2; 
f = 1; 
fs = 100; 
t = 0:1/fs:3;  
cosinus = A*cos(2*pi*f*t);
subplot(3,1,1);
plot(t,cosinus, 'b','LineWidth',2)
axis([0 3 -2 2]);
grid on
grid minor
title('x_{1}(t) ��areti');
xlabel('Zaman [sn]');
ylabel('Genlik [V]');
%% x2(t)
A1 = 4;
f1 = 2;
fs1 = 100;
t1 = 0:1/fs1:3;
kare = A1*square(2*pi*f1*t1);
subplot(3,1,2);
plot(t1,kare, 'r','LineWidth',2);
axis([0 3 -5 5]);
grid on
grid minor
title('x_{2}(t) ��areti');
xlabel('Zaman [sn]');
ylabel('Genlik [V]');
%% x3(t)
fs2=100;
t2=0:1/fs2:3;
subplot(3,1,3);
plot(t2,cosinus+kare, 'm','LineWidth',2);
axis([0 3 -10 10]);
grid on
grid minor
title('x_{3}(t) = x_{1}(t) + x_{2}(t) ��areti');
xlabel('Zaman [sn]');
ylabel('Genlik [V]');