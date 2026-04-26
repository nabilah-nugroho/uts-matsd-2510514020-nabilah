% =====================================================
% UTS Matematika Sains Data — Semester Genap 2025/2026
% Soal 3 — Segmentasi Pelanggan dan komposisi fungsi harga
% ---------------------------------------------------
% Nama : Nabilah Nur Aisyah Nugroho
% NIM : 2510514018
% Parameter: N=20, a=2, b=0, K=3, theta0=60, alpha=0.001
% Tanggal: <2026-04-22>
% =====================================================
clc; clear; close all;

K = 3;
N = 20;

% BAGIAN b Verifikasi himpunan dengan MATLAB

A = [N, N+2, N+4, N+7, N+10, N+13, N+15];
B = [N+3, N+5, N+7, N+10, N+12, N+18];
C = [N+1, N+7, N+10, N+11, N+17, N+20];

U = N:N+20;

gabungan = union(union(A,B),C);
irisan_tiga = intersect(intersect(A,B),C);
AB_intersect_C = intersect(union(A,B),C);
A_symdiff_B = setxor(A,B);

disp('A ='); disp(A);
disp('B ='); disp(B);
disp('C ='); disp(C);
disp('U ='); disp(U);

disp('|A union B union C| =');
disp(length(gabungan));

disp('A union B union C =');
disp(gabungan);

disp('|A intersect B intersect C| =');
disp(length(irisan_tiga));

disp('A intersect B intersect C =');
disp(irisan_tiga);

disp('(A union B) intersect C =');
disp(AB_intersect_C);

disp('A setxor B =');
disp(A_symdiff_B);


% BAGIAN d Menentukan invers f^-1(x)
% f(x) = K*x + (a+b)

a = 2;
b = 0;

syms x y

f = K*x + (a+b);

% Cari invers manual dengan solve:
% y = K*x + (a+b)
% x = (y - (a+b))/K

f_inv = solve(y == K*x + (a+b), x);

disp('f(x) =');
disp(f);

disp('f^{-1}(x) =');
disp(subs(f_inv, y, x));

% Pendapatan total:
% f(volume) = K*100 + a + b ribu
pendapatan = K*100 + a + b;

volume_manual = (pendapatan - (a+b)) / K;

fprintf('Pendapatan total = Rp %d ribu\n', pendapatan);
fprintf('Volume pembelian manual = %.0f\n', volume_manual);

% Verifikasi dengan subs
volume_subs = subs(subs(f_inv, y, pendapatan));
fprintf('Volume pembelian dengan subs = %.0f\n', volume_subs);

% Verifikasi dengan solve langsung
volume_solve = solve(K*x + (a+b) == pendapatan, x);
fprintf('Volume pembelian dengan solve = %.0f\n', volume_solve);