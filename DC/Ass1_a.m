pkg load statistics;

a_vals = [-3, -2, -1, 1, 2, 3];
b_vals = [-4, -5, -6, 4, 5, 6];
lambda = [0.3, 0.5, 1, 1.5, 2, 3];
lambda2 = [1, 2, 3, 4, 5, 6];

x1 = -10 : 0.01 : 10;
x2 = 0 : 0.01 : 10;
x3_vals = 0:30;  % Discrete range for Poisson

figure('Position', get(0, 'ScreenSize'));

for i = 1 : 6
    % Uniform Distribution
    a = min(a_vals(i), b_vals(i));
    b = max(a_vals(i), b_vals(i));
    uni = unifpdf(x1, a, b);
    mu = (a + b) / 2;
    sigma = sqrt((b - a)^2 / 12);
    gau = normpdf(x1, mu, sigma);

    % Exponential Distribution
    mu2 = 1 / lambda(i);  % mean
    exp_pdf = exppdf(x2, mu2);

    % Poisson Distribution
    mu3 = lambda2(i);  % mean = lambda
    poi_pdf = poisspdf(x3_vals, mu3);

    % Plot Uniform PDF
    subplot(4, 6, i);
    plot(x1, uni, 'b-', 'LineWidth', 2);
    xlabel('x'); ylabel('PDF');
    title(sprintf('Uniform PDF: a=%.1f, b=%.1f', a, b));
    grid on;
    axis([min(x1) max(x1) 0 max(uni) * 1.2]);

    % Plot Gaussian PDF
    subplot(4, 6, i + 6);
    plot(x1, gau, 'm-', 'LineWidth', 2);
    xlabel('x'); ylabel('PDF');
    title(sprintf('Gaussian from Uniform [%.1f, %.1f]\n\\mu=%.2f, \\sigma=%.2f', a, b, mu, sigma));
    grid on;
    axis([min(x1) max(x1) 0 max(gau) * 1.2]);

    % Plot Exponential PDF
    subplot(4, 6, i + 12);
    plot(x2, exp_pdf, 'g-', 'LineWidth', 2);
    xlabel('x'); ylabel('PDF');
    title(sprintf('Exponential PDF: mean=%.2f, lambda=%.2f', mu2, lambda(i)));
    grid on;
    axis([0 max(x2) 0 max(exp_pdf) * 1.2]);

    % Plot Poisson PMF
    subplot(4, 6, i + 18);
    stem(x3_vals, poi_pdf, 'filled', 'r');
    xlabel('x'); ylabel('PMF');
    title(sprintf('Poisson PMF: mean=%.2f, lambda=%.2f', mu3, mu3));
    grid on;
    axis([0 max(x3_vals) 0 max(poi_pdf) * 1.2]);
end
