clc; clear all; close all;

[x,fs] = audioread('mini_proj.wav');
t=0:(1/fs):(length(x)/fs); t=t(1:end-1);

figure; plot(x);title('input signal in time domain',"FontSize",20); grid on;
ylabel('x[n]',"FontSize",14); xlabel('samples',"FontSize",14);

figure; plot(t,x);title('input signal in time domain',"FontSize",20); grid on;
ylabel('x(t)',"FontSize",14); xlabel('time (seconds)',"FontSize",14);

%----------------------------------------
% Performing DTFT
[X, OM] = my_dtft(x);

X_mag = abs(X);
X_ph = angle(X);
freq = OM*fs/(2*pi);

% Spectrum Vs Frequency
figure; plot(freq,X_mag); title('Mag of X('+string(char(937))+')',"FontSize",20);
ylabel('|X('+string(char(937))+')|',"FontSize",14); xlabel('Freq (Hz)',"FontSize",14); 
xlim([0 fs/2]);
figure; plot(freq,X_ph); title('Phase of X('+string(char(937))+')',"FontSize",20);
ylabel('Phase(X('+string(char(937))+'))',"FontSize",14); xlabel('Freq (Hz)',"FontSize",14); 
xlim([0 fs/2]);

% Spectrum Vs Digital Frequency
figure; plot(OM,X_mag); title('Mag of X('+string(char(937))+')',"FontSize",20);
ylabel('|X('+string(char(937))+')|',"FontSize",14); xlabel(string(char(937))+'(rad)',"FontSize",14); 
xlim([0 pi]);
figure; plot(OM,X_ph); title('Phase of X('+string(char(937))+')',"FontSize",20);
ylabel('Phase(X('+string(char(937))+'))',"FontSize",14); xlabel(string(char(937))+'(rad)',"FontSize",14); 
xlim([0 pi]);

%----------------------------------------
% Notch filter
f1 = 1050; f1n = f1/(fs/2);
Th1 = f1n*pi;

f2 = 2200; f2n = f2/(fs/2);
Th2 = f2n*pi;

NC1 = 0.99;   NC2 = 0.99;
DC1 = 0.96;   DC2 = 0.96;

OM = 0:0.0001:pi;
z = exp(j*OM);

N1 = z - NC1*exp(j*Th1); N2 = z - NC1*exp(-j*Th1); N3 = z - NC2*exp(j*Th2); N4 = z - NC2*exp(-j*Th2);
D1 = z - DC1*exp(j*Th1); D2 = z - DC1*exp(-j*Th1); D3 = z - DC2*exp(j*Th2); D4 = z - DC2*exp(-j*Th2);

Num = ((N1.*N2).^1).*((N3.*N4).^1);
Den = ((D1.*D2).^1).*((D3.*D4).^1);
H = Num./Den;
H_mag = abs(H)/(max(abs(H)));
H_ph = angle(H);
figure; plot(OM,H_mag)
figure; plot(OM,H_ph);

H_db = 20*log10(H_mag);
fq = OM*fs/(2*pi);
%figure; plot(fq,H_db);
figure; plot(OM,H_db);

%----------------------------------------
% Coefficients of H
n1 = conv([1,-1*NC1*exp(j*Th1)],[1,-1*NC1*exp(-j*Th1)]);
n2 = conv([1,-1*NC2*exp(j*Th2)],[1,-1*NC2*exp(-j*Th2)]);
N = conv(n1,n2)

d1 = conv([1,-1*DC1*exp(j*Th1)],[1,-1*DC1*exp(-j*Th1)]);
d2 = conv([1,-1*DC2*exp(j*Th2)],[1,-1*DC2*exp(-j*Th2)]);
D = conv(d1,d2)

figure; zplane(N,D)

%----------------------------------------
% Filtered Output (1st order poles & zeros)
y = filter(N,D,x);
[Y, OM] = my_dtft(y);

Y_mag = abs(Y);
Y_ph = angle(Y);
freq = OM*fs/(2*pi);

figure; plot(freq,Y_mag); title('Mag of Y('+string(char(937))+')',"FontSize",20);
ylabel('|Y('+string(char(937))+')|',"FontSize",14); xlabel('Freq (Hz)',"FontSize",14);
figure; plot(freq,Y_ph); title('Phase of Y('+string(char(937))+')',"FontSize",20);
ylabel('Phase(Y('+string(char(937))+'))',"FontSize",14); xlabel('Freq (Hz)',"FontSize",14);

sound(y,fs)

%----------------------------------------
%----------------------------------------
% Filtered Output (5th order poles & zeros)
Num = ((N1.*N2).^5).*((N3.*N4).^5);
Den = ((D1.*D2).^5).*((D3.*D4).^5);
H = Num./Den;
H_mag = abs(H)/(max(abs(H)));
figure; plot(OM,H_mag)

H_db = 20*log10(H_mag);
fq = OM*fs/(2*pi);
%figure; plot(fq,H_db);
figure; plot(OM,H_db);

%----------------------------------------
% Filtered Output (5th order poles & zeros)
y2 = filter(N,D,x);
y2 = filter(N,D,y2);
y2 = filter(N,D,y2);
y2 = filter(N,D,y2); 
y2 = filter(N,D,y2); %5th order
[Y2, OM] = my_dtft(y2);

Y2_mag = abs(Y2);
Y2_ph = angle(Y2);
freq = OM*fs/(2*pi);

figure; plot(freq,Y2_mag); title('Mag of Y2('+string(char(937))+')',"FontSize",20);
ylabel('|Y('+string(char(937))+')|',"FontSize",14); xlabel('Freq (Hz)',"FontSize",14);
figure; plot(freq,Y2_ph); title('Phase of Y2('+string(char(937))+')',"FontSize",20);
ylabel('Phase(Y('+string(char(937))+'))',"FontSize",14); xlabel('Freq (Hz)',"FontSize",14);

sound(y2,fs)