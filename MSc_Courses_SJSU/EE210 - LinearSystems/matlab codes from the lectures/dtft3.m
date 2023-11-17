clc; clear; close all;

f1 = 50; f2 = 75;
fs = 100; % Aliasing

n = 0:(2*fs)-1;
x1=(1/2)*cos(2*pi*f1*(n/fs));
x2=(1)*cos(2*pi*f2*(n/fs));
%x1=(1/2)*sin(2*pi*f1*(n/fs));
%x2=(1)*sin(2*pi*f2*(n/fs));
x = x1 + x2;
OM = -pi:0.001:pi;

X = exp(-j*OM'*n)*x';

X_mag = abs(X);
freq = OM*fs/(2*pi);

plot(freq,X_mag)