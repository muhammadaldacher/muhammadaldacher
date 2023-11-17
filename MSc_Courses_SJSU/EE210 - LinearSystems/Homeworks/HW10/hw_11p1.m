clc; clear all; close all;
x = [5 -2 2 1 -1 3 -2 0];
n = 0:1:length(x)-1;
%FFT N=8
X = fft(x); 
%Y' = ctranspose(Y) which is the conjugate transpose

figure(1)
subplot(1,2,1); stem(n,abs(transpose(X)),'Linewidth',2); title('Magnitude of X(k)'); 
axis([-1 length(x) 0 max(abs(X))+1])
subplot(1,2,2); stem(n,angle(transpose(X)),'Linewidth',2); title('Phase of X(k)'); 
axis([-1 length(x) min(angle(X))-0.1 max(angle(X))+0.1])

xx = ifft(X)

