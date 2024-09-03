clear; clc; close all
Fs = 40;    % サンプリング周波数
t = 0:1/Fs:4.0-1/Fs; % 4秒間サンプリング
N = length(t);  % 信号の長さ
x = cos(5*2*pi*t) + cos(12*2*pi*t) + cos(18*2*pi*t); % 余弦波の線形結合
figure(1), plot(t,x)    %信号の図示

Nw = round(N/2); %窓関数の長さ
if 1 % 矩形窓を生成
    w = boxcar(Nw)'; %窓関数を生成(矩形窓)
else %ハミング窓を生成
    w = hamming(Nw)'; %窓関数の生成(ハミング窓)
end
w = [zeros(1,N/4) w zeros(1,N/4)]; %窓関数にゼロ詰め
y = w.*x; %窓関数(矩形窓)により切り出し

figure(2),plot(t,x,t,w) %窓関数の図示
figure(3),plot(t,y) %窓関数で切り出した信号の図示

Y = fft(y); %窓関数により切り出した信号を離散フーリエ変換
figure(4),plot([0:Fs/N:Fs-Fs/N],abs(Y)) %振幅スペクトルの図示(横軸-周波数)