clc; clear all; close all;

%DFT
N = 4;
n = 0:1:N-1;
x = sin(n*pi/2);

%DFT N=4
X = fft(x); X = transpose(X)

figure(1)
subplot(1,2,1); stem(n,abs(X),'Linewidth',2); title('Magnitude of X(k)'); 
axis([-1 N 0 max(abs(X))+1])
subplot(1,2,2); stem(n,angle(X),'Linewidth',2); title('Phase of X(k)'); 
axis([-1 N min(angle(X))-0.1 max(angle(X))+0.1])

xx = ifft(X)