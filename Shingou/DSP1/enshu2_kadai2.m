clear; clc;close all

Fs = 40;
t = 0:1/Fs:4.0-1/Fs;
N = length(t);
x = cos(5*2*pi*t) + cos(12*2*pi*t) + cos(18*2*pi*t);
% x = 0.9*cos(5*2*pi*t) + 0.4*cos(12*2*pi*t) + 0.7*cos(18*2*pi*t);
figure,plot(t,x);

Nw = round(N/2);
w = boxcar(Nw)';
w = [zeros(1,N/4) w zeros(1,N/4)];
y = w.*x;

figure,plot(t,x,t,w);
figure,plot(t,y);

Y = fft(y);
figure,plot([0:Fs/N:Fs-Fs/N],abs(Y))