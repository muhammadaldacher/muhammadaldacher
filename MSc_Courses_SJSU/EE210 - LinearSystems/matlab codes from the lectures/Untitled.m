clc; clear;

A = 1;
fs = 44100;
n = 0:2*fs-1;
t = n./fs;
f1 = 5000;
f2 = 10000;

x1 = 0.5*cos(2*pi*f1*t);
x2 = 2*cos(2*pi*f2*t);
x = x1 + x2;
% sound(x,fs)
% plot(n,x)
plot(t,x)

%h = fir1(100,7/22.05,'high');
% freqz(h)
%x = filter(h,1,x);
OM = 0:0.01:pi;

X = exp(-j*OM'*n)*x';
fq = OM*fs/(2*pi);
figure;
plot(fq,abs(X))



