pkg load statistics;

N = 1024;
Fs = 1000;
f = linspace(-Fs/2, Fs/2, 2*N - 1);

% Uniform [-3, 3]
x_uni = unifrnd(-3, 3, [1, N]);
x_uni = x_uni - mean(x_uni);  % Remove DC

% Gaussian (mean 0, std 1)
x_gau = normrnd(0, 1, [1, N]);
x_gau = x_gau - mean(x_gau);

% Exponential (lambda = 1)
x_exp = exprnd(1, [1, N]);
x_exp = x_exp - mean(x_exp);

% Poisson (lambda = 5)
x_poi = poissrnd(5, [1, N]);
x_poi = x_poi - mean(x_poi);

[acor_uni, lags] = xcorr(x_uni, 'coeff');
[acor_gau, ~] = xcorr(x_gau, 'coeff');
[acor_exp, ~] = xcorr(x_exp, 'coeff');
[acor_poi, ~] = xcorr(x_poi, 'coeff');

psd_uni = abs(fftshift(fft(acor_uni)));
psd_gau = abs(fftshift(fft(acor_gau)));
psd_exp = abs(fftshift(fft(acor_exp)));
psd_poi = abs(fftshift(fft(acor_poi)));

figure('Position', [50, 50, 1600, 1200]);

% Uniform
subplot(4,2,1);
plot(lags, acor_uni, 'b');
title('Autocorrelation - Uniform');
xlabel('Lag'); grid on;
ylim([-0.2 1]);

subplot(4,2,2);
plot(f, psd_uni, 'r');
title('PSD - Uniform');
xlabel('Frequency'); grid on;
xlim([-100 100]);
ylim([0 max(psd_uni)*0.1]);

% Gaussian
subplot(4,2,3);
plot(lags, acor_gau, 'b');
title('Autocorrelation - Gaussian');
xlabel('Lag'); grid on;
ylim([-0.2 1]);

subplot(4,2,4);
plot(f, psd_gau, 'r');
title('PSD - Gaussian');
xlabel('Frequency'); grid on;
xlim([-100 100]);
ylim([0 max(psd_gau)*0.1]);

% Exponential
subplot(4,2,5);
plot(lags, acor_exp, 'b');
title('Autocorrelation - Exponential');
xlabel('Lag'); grid on;
ylim([-0.2 1]);

subplot(4,2,6);
plot(f, psd_exp, 'r');
title('PSD - Exponential (DC removed)');
xlabel('Frequency'); grid on;
xlim([-100 100]);
ylim([0 max(psd_exp)*0.05]);

% Poisson
subplot(4,2,7);
plot(lags, acor_poi, 'b');
title('Autocorrelation - Poisson');
xlabel('Lag'); grid on;
ylim([-0.2 1]);

subplot(4,2,8);
plot(f, psd_poi, 'r');
title('PSD - Poisson (DC removed)');
xlabel('Frequency'); grid on;
xlim([-100 100]);
ylim([0 max(psd_poi)*0.05]);
