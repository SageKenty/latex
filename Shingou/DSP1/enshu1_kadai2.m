clear; clc; close all
Fs = 200;
t = 0:1/Fs:1.5;
y = sin(10 * 2 * pi * t) + sin(50*2*pi*t);
Y = mydft2024(y);
plot(abs(Y))
