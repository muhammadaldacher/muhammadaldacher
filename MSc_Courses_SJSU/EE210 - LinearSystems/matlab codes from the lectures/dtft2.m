clc; clear; close all;

f = 50;
fs = 40; % Aliasing

% f = 50;
% fs = 120; % No Aliasing

n = 0:(2*fs)-1;
x=sin(2*pi*f*(n/fs));

OM = -pi:0.001:pi;

X = exp(-j*OM'*n)*x';

X_mag = abs(X);
freq = OM*fs/(2*pi);

plot(freq,X_mag)