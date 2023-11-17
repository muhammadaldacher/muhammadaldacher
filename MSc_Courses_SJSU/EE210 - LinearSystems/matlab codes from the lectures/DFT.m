clc; clear all; close all;

% x = randn(1,20);
 x = [1 2 3 4]
% x = [ x x ]; %Here we have 2 cycles, freq response will be x2 in magnitude
% x = [ x x x x ]; % 16 samples in total but only 4 non zero samples
% x = [x zeros(1,100)];
% x = [zeros(1,100) x]; % same magnitude, but different phase
x = [x zeros(1,100)];
OM = 0:0.01:2*pi;
N = length(x);
n = 0:N-1;

%DTFT
X = exp(-j*OM'*n)*x';
% plot(OM,abs(X));

%DFT
k =n;
Xk = exp(-j*2*pi*k'*n/N)*x';
dfq = linspace(0,2*pi,N+1);
dfq = dfq(1:N);

hold on;
stem(dfq,abs(Xk),'o','r');
figure
stem(dfq,angle(Xk),'o','b');