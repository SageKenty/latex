clear; clc; close all

% ****
% ここに課題2（2）のプログラムを書け
% ****


N = 35;
f = randn(1,N);
figure(1);stem(f) %もとの信号の表示
Y1 = mydft2024(f) %信号を変換
figure(2);stem(Y1) %変換した信号を表示
Y2 = myidft2024(Y1) %変換した信号のスペクトルを逆離散フーリエ変換
figure(3);stem(Y2)

function F = mydft2024(f)
    N = length(f);		%信号の長さ
    F = zeros(1,N);	%スペクトルの初期化
    
    %DFTの実装
    for k = 0:N-1
        for n = 0:N-1
             F(k + 1) =F(k + 1) + f(n + 1) * exp(-j * (2 * pi / N) * k * n);
        end
    end
end

function f = myidft2024(F)
    N = length(F);   %信号の長さ
    f = zeros(1,N);  %信号の初期化
    
    %IDFTの実装
    for n = 0:N-1
        for k = 0:N-1
                f(n+1) = f(n+1) + F(k + 1) * exp(j * (2 * pi / N) * k * n);
        end
         f(n+1) =  f(n+1) / N ;
    end
end