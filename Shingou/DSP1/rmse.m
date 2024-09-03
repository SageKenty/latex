function RMSE = rmse(x,y,N)
F = zeros(1,N); %スペクトルの初期化
%RMSE
for n = 1:N-1
    F(n + 1) = F(n + 1) + ((x(n + 1) - y(n + 1))^2);
end
RMSE = sqrt(F(N)/ N);