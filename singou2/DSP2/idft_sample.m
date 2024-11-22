function[f] = idft_sample(F)
N = length(F);
f = zeros(1,N);

for n = 0:N-1
    for k = 0:n-1
        f(n + 1) = f(n + 1)+ F(k + 1)*exp(1i * ((2 * pi) / N) * k * n);
    end
    f(n + 1) = f(n + 1) / N; 
end

f = real(f);