clear; clc; close all
numN = 100:200:2000;

for index = 1:length(numN)
    N = numN(index);
    y = rand(1,N);

    tic;
    Y1 = mydft2024(y);
    t_dft(index) = toc;

    tic;
    Y2 = fft(y);
    t_fft(index) = toc;
end

figure(1);plot(numN,t_dft,numN,t_fft, ...
'LineWidth',2)
legend('DFT','FFT')