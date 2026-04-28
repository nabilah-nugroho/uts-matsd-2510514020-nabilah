% =====================================================
% UTS Matematika Sains Data — Semester Genap 2025/2026
% Soal 7 — Forecasting Penjualan dengan barisan, Deret, dan Notasi Sigma
% ---------------------------------------------------
% Nama : Nabilah Nur Aisyah Nugroho
% NIM : 2510514020
% Parameter: N=20, a=2, b=0, K=3, theta0=60, alpha=0.001
% Tanggal: 2026-04-28
% =====================================================
% 
clc; clear; close all;

% BAGIAN C VERIFIKASI

K = 3;
a = 2;

n = 1:12;
S = 50 + K*n + ((-1).^n)*(a+1);

T1 = sum(S);
T2 = sum(S.^2);

disp(S)
fprintf('T1 = %.6f\n', T1);
fprintf('T2 = %.6f\n', T2);

% BAGIAN E FORECASTING

K = 3;
a = 2;

t = 1:12;
S = 50 + K*t + ((-1).^t)*(a+1);

p = polyfit(t, S, 1);

slope = p(1);
intercept = p(2);

t_pred = 13:18;
S_pred = polyval(p, t_pred);

S_fit = polyval(p, t);
MAE = mean(abs(S - S_fit));
residual = S - S_fit;

fprintf('Slope = %.6f\n', slope);
fprintf('Intercept = %.6f\n', intercept);
fprintf('MAE = %.6f\n', MAE);

disp('Prediksi S13 sampai S18:');
disp(S_pred);

figure;
plot(t, S, 'bo', 'LineWidth', 1.5);
hold on;
plot(1:18, polyval(p, 1:18), 'r--', 'LineWidth', 1.5);
plot(t_pred, S_pred, 'g^', 'LineWidth', 1.5);

xlabel('Bulan ke-t');
ylabel('Penjualan S_t');
title('Forecasting Penjualan 6 Bulan ke Depan');
legend('Data historis', 'Garis tren linear', 'Prediksi');
grid on;
hold off;

disp('Residual tiap bulan:');
disp(S - S_fit);

disp('Absolute error tiap bulan:');
disp(abs(S - S_fit));