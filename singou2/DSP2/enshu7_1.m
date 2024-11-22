clear all; clc; close all
N = 32; % フィルタ係数の数（フィルタ長2N-2）
L = 1024 ; % 周波数サンプル数
dw = pi/(L-1);
wp = 0.35; % 通過域のエッジ
pe = ceil(wp*L);
d = [ones(pe,1); zeros(L-pe,1)]; % 所望特性（ローパスフィルタ）
Q = [ones(L,1) cos((0:L-1)'*(1:(N-1))*dw)]; % 基底周波数成分を並べた行列
a = (transpose(Q)*Q)\(transpose(Q)*d); % 最小自乗法によるフィルタ係数の推定
coef = [flipud(a(2:end))/2; a(1); a(2:end)/2]; 
% フィルタ係数の対称性より、長さ2N-2のフィルタ係数を導出
H = fft(coef, 2*L); % 設計したフィルタの周波数特性H
figure(1);plot(1:length(H(1:L)),abs(H(1:L)), 1:length(H(1:L)), d)