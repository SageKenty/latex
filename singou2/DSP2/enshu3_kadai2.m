clear; clc; close all
L = 10; % ウィンドウ長さ
w =  zeros(L);
N = L - 1;
for n = 0:N
    w(n+1) = 0.54 - 0.46 * cos(2 * pi * (n / N));
end

w_h = hamming(L); % hamming関数

figure;plot(w)
figure;plot(w_h)

%ハミング窓の振幅スペクトルを表示せよ
figure;plot(abs(dft_sample(w)));