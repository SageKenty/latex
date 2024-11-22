clear; clc; close all
x = [3.4 2.4 5.6 -0.5 6.0 2.8 3.0 -3.2 3.9 2.0]'; % 入力信号
h = [1.0 0.6 0.4 -0.5 2.1]'; % インパルス応答
y = myconv(x, h); % 自作関数を用いた畳み込み処理
yy = conv(x, h); % conv関数を用いた畳み込み処理
figure(1), plot(y)
figure(2), plot(yy) 