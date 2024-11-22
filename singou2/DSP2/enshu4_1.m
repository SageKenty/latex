clear; clc; close all
f1 = [0 1 2 4 5 3 2 1 0];
N = 64;
F1 = fft(f1,64);
f2 = [0 f1(1:end-1)];
F2 = fft(f2,64);
pd = angle(F2)- angle(F1);
md = abs(F2) - abs(F1);
figure(1);plot(pd);
figure(2);plot(md);
