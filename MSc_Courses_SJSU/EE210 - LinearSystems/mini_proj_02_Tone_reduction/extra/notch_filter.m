fs = 44100;
%----------------------------------------
% Notch filter
f1 = 1053; f1n = f1/(fs/2);
Th1 = f1n*pi;

f2 = 2197; f2n = f2/(fs/2);
Th2 = f2n*pi;

NC1 = 0.99;   NC2 = 0.99;
DC1 = 0.85;   DC2 = 0.85;

 OM = 0:0.001:pi;
 z = exp(j*OM);

N1 = z - NC1*exp(j*Th1); N2 = z - NC1*exp(-j*Th1); N3 = z - NC2*exp(j*Th2); N4 = z - NC2*exp(-j*Th2);
D1 = z - DC1*exp(j*Th1); D2 = z - DC1*exp(-j*Th1); D3 = z - DC2*exp(j*Th2); D4 = z - DC2*exp(-j*Th2);

H = ((N1.*N2.*N3.*N4).^3)./((D1.*D2.*D3.*D4).^3);
H_mag = abs(H)/(max(abs(H)));
%figure; plot(OM,H_mag)

H_db = 20*log10(H_mag);
figure;
fq = OM*fs/(2*pi);
plot(fq,H_db);

