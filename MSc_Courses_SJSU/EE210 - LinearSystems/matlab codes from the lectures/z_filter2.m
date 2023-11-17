% Notch Filter
clc; clear all; close all;
DC = 0.99;
NC = 0.999;
Th = 0.4*pi;
fs = 150;

OM = 0:0.001:pi;
z = exp(j*OM);
N1 = z - NC*exp(j*Th);
N2 = z - NC*exp(-j*Th);
D1 = z - DC*exp(j*Th);
D2 = z - DC*exp(-j*Th);

%H = (N1.*N2)./(D1.*D2);
H = (N1.*N2)./(D1.*D2);
H_mag = abs(H)/(max(abs(H)));
plot(OM,H_mag)

H_db = 20*log10(H_mag);
figure;
plot(OM,H_db);
fq = OM*fs/(pi);

figure;
plot(fq,H_db);
