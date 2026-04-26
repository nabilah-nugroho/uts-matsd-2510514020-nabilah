% =====================================================
% UTS Matematika Sains Data — Semester Genap 2025/2026
% Soal 2 — Enkripsi Citra Logo Toko dengan Invers Matriks 3x3
% ---------------------------------------------------
% Nama : Nabilah Nur Aisyah Nugroho
% NIM : 2510514018
% Parameter: N=20, a=2, b=0, K=3, theta0=60, alpha=0.001
% Tanggal: <2026-04-22>
% =====================================================
clc; clear; close all;

% Parameter
N = 20;
a = 2;
b = 0;

% Matriks kunci A
A = [a+1   b     2;
     1     a+2   b;
     b     1     a+3];

disp('Matriks A =');
disp(A);


%BAGIAN d: Verifikasi invers manual vs inv(A)

detA = det(A);
fprintf('det(A) = %.4f\n', detA);

if abs(detA) < 1e-10
    error('Matriks A singular, invers tidak ada.');
end

% Hitung kofaktor manual
n = size(A,1);
C = zeros(n);

for i = 1:n
    for j = 1:n
        minorA = A;
        minorA(i,:) = [];
        minorA(:,j) = [];
        C(i,j) = (-1)^(i+j) * det(minorA);
    end
end

AdjA = C';
A_inv_manual = AdjA / detA;

% Invers MATLAB
A_inv_matlab = inv(A);

disp('Matriks Kofaktor C =');
disp(C);

disp('Matriks Adjoin Adj(A) =');
disp(AdjA);

disp('A^-1 manual =');
disp(A_inv_manual);

disp('A^-1 MATLAB inv(A) =');
disp(A_inv_matlab);

% Error Frobenius
err_fro = norm(A_inv_manual - A_inv_matlab, 'fro');
fprintf('Error Frobenius = %.12e\n', err_fro);

if err_fro < 1e-10
    disp('Verifikasi BERHASIL: error < 1e-10');
else
    disp('Verifikasi GAGAL: error >= 1e-10');
end


% BAGIAN f

% Blok piksel asli P
P = [120       50+N   200;
     80        a+2    10+N;
     30+N      90     170];

disp('Blok Piksel Asli P =');
disp(P);

% Enkripsi
E = A * P;

disp('Blok Terenkripsi E =');
disp(E);

% Dekripsi / rekonstruksi
P_rekonstruksi = A_inv_manual * E;

disp('Blok Rekonstruksi P'' =');
disp(P_rekonstruksi);

% Error rekonstruksi
err_rekonstruksi = norm(P_rekonstruksi - P, 'fro');
fprintf('Error rekonstruksi = %.12e\n', err_rekonstruksi);

% Visualisasi
figure;

subplot(1,2,1);
imshow(uint8(P));
title('Blok Asli P');

subplot(1,2,2);
imshow(uint8(round(P_rekonstruksi)));
title('Blok Rekonstruksi P''');

sgtitle('Perbandingan Blok Citra Asli dan Rekonstruksi');

% Alternatif visualisasi dengan angka intensitas
figure;

subplot(1,2,1);
imagesc(P);
colormap gray;
colorbar;
axis equal tight;
title('imagesc(P)');

subplot(1,2,2);
imagesc(P_rekonstruksi);
colormap gray;
colorbar;
axis equal tight;
title('imagesc(P'')');

sgtitle('Visualisasi Grayscale dengan imagesc | NIM: 2510514020');