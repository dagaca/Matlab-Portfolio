%% sin-cos plot
% sin ve cos bir arada �izdirilmi�tir.
clear all;close all;clc
x = 0:pi/100:2*pi;
y = sin(x);
plot(x,y)

hold on

y2 = cos(x);
plot(x,y2)
legend('sin','cos')

hold off