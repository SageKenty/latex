clear; clc; close all;
Fs = 200;
t = 0:1/Fs:2;

f1 = 0.6 * sin(50 * 2 * pi * t);
f2 = 1.2 * sin(20 * 2 * pi * t);
f = f1 + f2;

F = mydft2024(f);
figure(1);plot(abs(F))
figure(2);plot(angle(F))