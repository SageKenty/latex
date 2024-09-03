clear;clc;close all
f = [0:0.5:20 0:
    2:10 10:-2:0] %時間域信号
F =  mydft2024(f);%離散フーリエ変換
figure(1);stem(f) %信号の表示
figure(2);stem(abs(F)) %振幅スペクトルの表示