clc;clear;

% [x,fs] = audioread('mark.wav');
[x,fs] = audioread('Muhammad_Aldacher_ee210.wav');

% plot(x)
% sound(x,fs)
x = x';
yy = x;
% sound(x,fs);

N = length(x);
n = 0:N-1;
f = 5000;
ns = 0.5*cos(2*pi*f*n/fs)

x = x + ns;
% sound(x,fs);
h = fir1(100,1/8,'low');
x = filter(h,1,x);


OM = -2*pi:0.1:2*pi;
X = exp(-j*OM'*n)*x';

fq = OM*fs/(2*pi);
plot(fq,abs(X))
% pause(11);
sound(x,fs)
% figure;
% 
% plot(yy)
% hold on;
% plot(x,'r');
% hold off;
