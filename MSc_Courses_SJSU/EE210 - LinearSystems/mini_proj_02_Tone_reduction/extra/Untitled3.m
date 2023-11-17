clc; clear;

NC = 0.9999;
DC = 0.999;
Th = 0.4*pi;

OM = 0:0.001:pi;
% z = exp(j*OM);

syms z

N1 = z - NC*exp(j*Th);
N2 = z - NC*exp(-j*Th);
N12 = N1*N2;
CoefN = double(coeffs(N12))

% D1 = z - DC*exp(j*Th);
% D2 = z - DC*exp(-j*Th);
% 
% 
% H = (N1.*N2)./(D1.*D2);
% fs = 300;
% H_mag = (H)/(max(abs(H)));
% plot(OM,(abs(H_mag)));
% fq = OM*fs/(2*pi);
% plot(fq,20*log10(abs(H_mag)));
% % H_db = 20*log10(H_mag)
% % figure;
% % plot(OM,abs(H_db));