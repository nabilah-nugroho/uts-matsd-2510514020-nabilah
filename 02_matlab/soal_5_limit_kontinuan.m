% =====================================================
% UTS Matematika Sains Data — Semester Genap 2025/2026
% Soal 5 — Konvergensi Customer Lifetime Value dan Kekontinuan Biaya 
% ---------------------------------------------------
% Nama : Nabilah Nur Aisyah Nugroho
% NIM : 2510514018
% Parameter: N=20, a=2, b=0, K=3, theta0=60, alpha=0.001
% Tanggal: <2026-04-22>
% =====================================================
clc; clear; close all;

syms x

a = 2;
b = 0;
K = 3;

% bagian b
% verifikasi l1, l2, l3 menggunakan syms dan limit()

L1 = limit((x^2 - K^2)/(x - K), x, K);
L2 = limit(((x + (K+1))^3 - (K+1)^3)/x, x, 0);
L3 = limit(((a+2)*x^3 + b*x + 7)/(x^3 - x + K), x, inf);
disp('hasil limit bagian b:');

disp('L1 =');
disp(L1);

disp('L2 =');
disp(L2);

disp('L3 =');
disp(L3);

% bagian g
% plot c(x) yang kontinu di x = k
% agar kontinu di x = k:
% ruas kiri saat x -> k adalah 2k
% maka p = 2k
% ruas kanan saat x = k adalah a*k + q
% maka q = p - a*k

p = 2*K;
q = p - a*K;

fprintf('p = %.0f\n', p);
fprintf('q = %.0f\n', q);

% interval x dari 0 sampai 2k
x1 = linspace(0, K, 200);
x2 = K;
x3 = linspace(K, 2*K, 200);

% definisi fungsi piecewise
C1 = (x1.^2 - K^2) ./ (x1 - K);
C2 = p;
C3 = a*x3 + q;

% karena x = k membuat penyebut nol pada c1, pakai bentuk sederhana
C1 = x1 + K;

% plot fungsi
figure;

plot(x1, C1, 'linewidth', 2);
hold on;

plot(x2, C2, 'o', 'markersize', 8, 'linewidth', 2);

plot(x3, C3, 'linewidth', 2);

% garis vertikal x = k
xline(K, '--', 'x = k');

grid on;
xlabel('x');
ylabel('c(x)');
title('plot fungsi biaya piecewise c(x)');
legend('c(x) = (x^2-k^2)/(x-k)', ...
       'c(k) = p', ...
       'c(x) = ax + q', ...
       'lokasi x = k', ...
       'location', 'best');

% cek kekontinuan
fprintf('limit kiri di x = k = %.0f\n', 2*K);
fprintf('nilai fungsi di x = k = %.0f\n', p);
fprintf('limit kanan di x = k = %.0f\n', a*K + q);