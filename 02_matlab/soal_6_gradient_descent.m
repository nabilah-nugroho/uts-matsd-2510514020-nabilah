% =====================================================
% UTS Matematika Sains Data — Semester Genap 2025/2026
% Soal 6 — Optimasi Harga Produk Via Gradient Descent Manual
% ---------------------------------------------------
% Nama : Nabilah Nur Aisyah Nugroho
% NIM : 2510514020
% Parameter: N=20, a=2, b=0, K=3, theta0=60, alpha=0.001
% Tanggal: <2026-04-28>
% =====================================================

clc; clear; close all;

%BAGIAN E
% Parameter
alpha = 0.001;
x0 = 1;
iterasi = 500;

% Fungsi profit dan turunan profit
pi_fun = @(x) -3*x.^3 + 15*x.^2 + 100*x - 90;
dpi_fun = @(x) -9*x.^2 + 30*x + 100;

% Menyimpan nilai x dan profit
x = zeros(iterasi+1, 1);
profit = zeros(iterasi+1, 1);

% Titik awal
x(1) = x0;
profit(1) = pi_fun(x(1));

% Iterasi Gradient Descent
for k = 1:iterasi
    x(k+1) = x(k) + alpha * dpi_fun(x(k));
    profit(k+1) = pi_fun(x(k+1));
end

% Solusi analitik dari 6.1
x_analitik = (5 + 5*sqrt(5))/3;
profit_analitik = pi_fun(x_analitik);

% Tampilkan hasil
fprintf('Titik awal x0 = %.6f\n', x0);
fprintf('Profit awal = %.6f\n', pi_fun(x0));
fprintf('Titik akhir Gradient Descent = %.6f\n', x(end));
fprintf('Profit akhir Gradient Descent = %.6f\n', profit(end));
fprintf('Solusi analitik = %.6f\n', x_analitik);
fprintf('Profit maksimum analitik = %.6f\n', profit_analitik);

% Plot konvergensi pi(x_k) vs k
figure;
plot(0:iterasi, profit, 'LineWidth', 1.5);
xlabel('Iterasi k');
ylabel('\pi(x_k)');
title('Konvergensi Profit \pi(x_k) terhadap Iterasi');
grid on;

% Plot kurva profit
x_range = linspace(-3, 8, 500);
y_range = pi_fun(x_range);

figure;
plot(x_range, y_range, 'LineWidth', 1.5);
hold on;
plot(x0, pi_fun(x0), 'o', 'MarkerSize', 8);
plot(x(end), profit(end), 's', 'MarkerSize', 8);
plot(x_analitik, profit_analitik, '*', 'MarkerSize', 10);

xlabel('x');
ylabel('\pi(x)');
sgtitle(['Gradient Descent Run - ', datestr(now)])
title('Kurva Profit, Titik Awal, Titik Akhir, dan Solusi Analitik');
legend('Kurva \pi(x)', 'Titik awal x_0', ...
       'Titik akhir GD', 'Solusi analitik');
grid on;
hold off;

%BAGIAN F

% Parameter

alpha1 = 0.001;
alpha2 = 10 * alpha1;
alpha3 = 0.1 * alpha1;

alpha_list = [alpha1, alpha2, alpha3];
label_list = {'\alpha = 0.001', '\alpha'' = 0.01', '\alpha'''' = 0.0001'};

% Fungsi profit dan turunannya
pi_fun = @(x) -3*x.^3 + 15*x.^2 + 100*x - 90;
dpi_fun = @(x) -9*x.^2 + 30*x + 100;

figure;
hold on;

for i = 1:length(alpha_list)
    alpha = alpha_list(i);

    x = zeros(iterasi+1,1);
    profit = zeros(iterasi+1,1);

    x(1) = x0;

    for k = 1:iterasi
        profit(k) = pi_fun(x(k));
        x(k+1) = x(k) + alpha * dpi_fun(x(k));
    end

    profit(iterasi+1) = pi_fun(x(iterasi+1));

    plot(0:iterasi, profit, 'LineWidth', 1.5);
end

xlabel('Iterasi ke-k');
ylabel('\pi(x_k)');
title('Perbandingan Konvergensi untuk Beberapa Learning Rate');
sgtitle(['Gradient Descent Run - ', datestr(now)])
legend(label_list);
grid on;
hold off;