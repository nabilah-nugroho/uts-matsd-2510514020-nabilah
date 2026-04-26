% =====================================================
% UTS Matematika Sains Data — Semester Genap 2025/2026
% Soal 4 — Segmentasi Pelanggan dan komposisi fungsi harga
% ---------------------------------------------------
% Nama : Nabilah Nur Aisyah Nugroho
% NIM : 2510514018
% Parameter: N=20, a=2, b=0, K=3, theta0=60, alpha=0.001
% Tanggal: <2026-04-22>
% =====================================================
clc; clear; close all;

a = 2;
b = 0;
k = 3;
n = 20;

theta_deg = 60;
theta_rad = deg2rad(theta_deg);

% fasor penjualan
z1 = (a+2) + (b+1)*1i;
z2 = (b+1) - (a+2)*1i;

disp('z1 =');
disp(z1);

disp('z2 =');
disp(z2);

% bagian b
% hitung z1 + z2, z1 * z2, z1 / z2, dan |z1 - z2|
hasil_tambah = z1 + z2;
hasil_kali = z1 * z2;
hasil_bagi = z1 / z2;
mod_selisih = abs(z1 - z2);

disp('z1 + z2 =');
disp(hasil_tambah);

disp('z1 * z2 =');
disp(hasil_kali);

disp('z1 / z2 =');
disp(hasil_bagi);

disp('|z1 - z2| =');
disp(mod_selisih);

fprintf('|z1 - z2| = %.4f\n', abs(z1 - z2));


% bagian e
% plot tiga akar kubik dari w = 8 cis(theta)
r = 8;
theta0 = theta_rad;

% rumus akar pangkat tiga
% zk = r^(1/3) cis((theta0 + 2*pi*k)/3), k = 0,1,2

akar = zeros(1,3);

for m = 0:2
    sudut = (theta0 + 2*pi*m) / 3;
    akar(m+1) = r^(1/3) * (cos(sudut) + 1i*sin(sudut));
end

disp('tiga akar kubik (a + bi):');
disp(akar.');

disp('modulus akar:');
disp(abs(akar).');

disp('argumen (derajat):');
disp(rad2deg(angle(akar)).');

% plot bidang argand
figure;
plot(real(akar), imag(akar), 'o', 'markersize', 10, 'linewidth', 2);
hold on;

% hubungkan titik jadi segitiga
plot(real([akar akar(1)]), imag([akar akar(1)]), '-', 'linewidth', 2);

% garis dari origin ke tiap titik
for m = 1:3
    plot([0 real(akar(m))], [0 imag(akar(m))], '--');
    text(real(akar(m))+0.1, imag(akar(m))+0.1, ...
        sprintf('z_%d', m));
end

grid on;
axis equal;
xlabel('real');
ylabel('imajiner');
title('akar kubik dari w = 8 cis(60°) | NIM: 2510514020');

% gambar lingkaran radius 2
t = linspace(0, 2*pi, 300);
plot(2*cos(t), 2*sin(t), ':');

legend('akar', 'segitiga', 'garis dari origin');

% cek panjang sisi segitiga
sisi12 = abs(akar(1) - akar(2));
sisi23 = abs(akar(2) - akar(3));
sisi31 = abs(akar(3) - akar(1));

fprintf('sisi 1-2 = %.4f\n', sisi12);
fprintf('sisi 2-3 = %.4f\n', sisi23);
fprintf('sisi 3-1 = %.4f\n', sisi31);