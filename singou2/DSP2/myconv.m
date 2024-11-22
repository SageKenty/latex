function [y] = myconv(x, h)
x = x(:); % 入力信号を縦ベクトルに
h = h(:); % インパルス応答を縦ベクトルに
m = length(x); % 入力信号の長さ
n = length(h); % フィルタの長さ
y = zeros(m + n - 1, 1); % 出力信号の初期化
for k = 1:m + (n -  1)
    
    for l = max(1,k - n + 1):min(k, m)
        y(k) = y(k) + x(l) * h(k - l + 1);
    end

end