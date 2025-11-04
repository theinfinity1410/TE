pkg load communications;

M = input('Enter M (e.g., 4 for QPSK, 8 for 8-PSK): ');
N = 1e5;
x = randi([0 M-1], N, 1);
modSig = pskmod(x, M, 0, 'gray');
snr = 0:2:20;
ber = zeros(size(snr));

for i = 1:length(snr)
  rx = awgn(modSig, snr(i), 'measured');
  y = pskdemod(rx, M, 0, 'gray');
  [~, ber(i)] = biterr(x, y);
end

EbNo = snr - 10*log10(log2(M));
theory = 2*qfunc(sqrt(2*log2(M)*10.^(EbNo/10))*sin(pi/M));

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
title(sprintf('%d-PSK BER vs SNR', M));
xlabel('SNR (dB)'); ylabel('BER'); legend('Simulated','Theoretical'); grid on;
