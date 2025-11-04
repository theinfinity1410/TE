clc; clear; close all;
pkg load communications;

M = input('Enter M (e.g., 4 for 4-QAM, 16 for 16-QAM): ');
N = 1e5;
x = randi([0 M-1], N, 1);
modSig = qammod(x, M, 0, 'gray');
snr = 0:2:20;
ber = zeros(size(snr));

for i = 1:length(snr)
  rx = awgn(modSig, snr(i), 'measured');
  y = qamdemod(rx, M, 'gray');
  [~, ber(i)] = biterr(x, y);
end

EbNo_dB = SNR_dB - 10*log10(log2(M));
EbNo = 10.^(EbNo_dB/10);
arg = sqrt( (3*log2(M)./(M-1)) .* EbNo );
theory = (4*(1 - 1/sqrt(M))./log2(M)) .* qfunc(arg);

figure;
subplot(1,3,1);
plot(real(modSig), imag(modSig), 'b.');
title('No Noise'); xlabel('In-phase'); ylabel('Quadrature'); axis equal; grid on;

subplot(1,3,2);
rx_awgn = awgn(modSig, 30, 'measured');
plot(real(rx_awgn), imag(rx_awgn), 'r.');
title('With AWGN (10 dB)'); xlabel('In-phase'); ylabel('Quadrature'); axis equal; grid on;

subplot(1,3,3);
semilogy(snr, ber, 'bo-', snr, theory, 'r*-');
title(sprintf('%d-QAM BER vs SNR', M));
xlabel('SNR (dB)'); ylabel('BER'); legend('Simulated','Theoretical'); grid on;
