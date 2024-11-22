function[F] = dft_sample(f)
    N = length(f);
    F = zeros(1,N);

    for k = 0:N-1
        for n = 0:N-1
            F(k+1)=F(k+1)+f(n+1)*exp(-1i*((2*pi)/N)*k*n);
        end
    end
end