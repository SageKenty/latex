clear;clc; close all;

N = 35;
y = randn(1,N);
figure(1),stem(y)

Y1 = mydft2024(y);
Y2 = fft(y);

figure(2),stem(abs(Y1))
figure(3),stem(abs(Y2))

RMSE = myRMSE(Y1,Y2,N);
disp(RMSE)

function RMSE = myRMSE(x,y,N)
    F = zeros(1,N); %スペクトルの初期化
    %RMSE
    for n = 1:N-1
        F(n + 1) = F(n + 1) + ((x(n + 1) - y(n + 1))^2);
    end
    RMSE = sqrt(F(N)/ N);
end

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