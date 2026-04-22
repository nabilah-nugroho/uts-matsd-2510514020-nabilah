% =====================================================
% UTS Matematika Sains Data — Semester Genap 2025/2026
% Soal 1 — Eksplorasi Awal dan Profil Data Transaksi 
% ---------------------------------------------------
% Nama : Nabilah Nur Aisyah Nugroho
% NIM : 2510514018
% Parameter: N=20, a=2, b=0, K=3, theta0=60, alpha=0.001
% Tanggal: <2026-04-22>
% =====================================================
clc; clear; close all;

% parameter personalisasi
N = 20;
a = 2;
b = 0;
k = 3;

% rumus pembentukan data toko
data_toko = zeros(1,7);
for i = 1:7
    data_toko(i) = 20 + (k*i) + mod(a*i, 7) - mod(b*i, 5);
    fprintf("D_%d = %.2f\n", i, data_toko(i))
end

% verifikasi hasil hitung manual
x = mean(data_toko);
y = median(data_toko);
z = mode(data_toko);
r = range(data_toko);
s = std(data_toko, 1);
u = unique(data_toko);

fprintf("\nmean             : %.2f\n", x);
fprintf("median           : %.2f\n", y);

freq = arrayfun(@(n) sum(data_toko == n), u);
if max(freq) == 1
    fprintf("modus            : tidak ada modus\n");
else
    fprintf("modus            : %.2f\n", z);
end

fprintf("range            : %.2f\n", r);
fprintf("standar deviasi  : %.2f\n", s);