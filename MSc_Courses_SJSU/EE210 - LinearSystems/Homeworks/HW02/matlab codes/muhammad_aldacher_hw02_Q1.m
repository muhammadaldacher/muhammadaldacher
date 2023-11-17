clc; clear; close all;

fs = 60000; %has to be 2 times the biggest freq component
n = 0:2*fs-1;
t = n./fs;

x = 1300*pi*t;

%y = sin(3.*x).*cos(5.*x);
%y = ((sin(3.*x)).^2).*cos(2.*x);
y = (cos(3.*x)).^3;
plot(t,y)

OM = 0:0.005:pi;

Y = exp(-j*OM'*n)*y';
fq = OM*fs/(2*pi);
figure;
plot(fq,abs(Y))
figure;
plot(fq,angle(Y))



