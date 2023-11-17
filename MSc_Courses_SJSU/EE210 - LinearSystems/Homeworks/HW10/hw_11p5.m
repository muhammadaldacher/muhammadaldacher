clc; clear all; close all;

%DFT
N = 4;
n = 0:1:N-1;
h = (-0.95).^n;

%DFT N=4
H = fft(h); H = transpose(H)

figure(1)
subplot(1,2,1); stem(n,abs(H),'Linewidth',2); title('Magnitude of H(k)'); 
axis([-1 N 0 max(abs(H))+1])
subplot(1,2,2); stem(n,angle(H),'Linewidth',2); title('Phase of H(k)'); 
axis([-1 N min(angle(H))-0.1 max(angle(H))+0.1])

hh = ifft(H)
