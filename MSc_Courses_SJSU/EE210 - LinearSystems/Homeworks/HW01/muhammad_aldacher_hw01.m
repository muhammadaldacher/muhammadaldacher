clc;clear;

[x,fs] = audioread('Muhammad_Aldacher_ee210.wav');

plot(x)
sound(x,fs)
title('Plotting Amplitude Vs Samples')
xlabel('N'); ylabel('Amplitude')

%=================================================
N = length(x);
n = 0:N-1;

OM = 0:0.005:pi;
X = exp(-j*OM'*n)*x;

fq = OM*fs/(2*pi);
figure
plot(fq,abs(X))
title('Plotting Spectrum Vs Frequency')
xlabel('Frequency (Hz)'); ylabel('Spectrum')

%=================================================
%=================================================
clc; clear;

A = 0.5;
fs = 44100;
n = 0:2*fs-1;
f = 16000;

x = A*cos(2*pi*f*n/fs);
sound(x,fs)
plot(n,x)
