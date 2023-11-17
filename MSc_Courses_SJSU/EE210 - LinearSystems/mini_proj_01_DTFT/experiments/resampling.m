%Resampling a sound file from its fs to fs=16Khz
clc;clear all; close all;

[z,fs] = audioread('MiniProject01.wav');
% sound(z,fs)
t=0:(1/fs):(length(z)/fs); t=t(1:end-1);
figure(1);title('time domain');
plot(t,z); hold on;

N = length(z);
n = 0:N-1;

OM = 0:0.005:pi;
X = exp(-j*OM'*n)*z;

fq = OM*fs/(2*pi);
figure(2);title('freq domain'); hold on;
plot(fq,abs(X))
%----------------------------------------

%Resampling to fs = 16KHz
x = resample(z,16000,fs);
fs = 16000;
audiowrite('newaudio.wav',x,fs)
[x,fs] = audioread('newaudio.wav');

t=0:(1/fs):(length(x)/fs); t=t(1:end-1);
% sound(x,fs)
figure(1);plot(t,x)

N = length(x);
n = 0:N-1;

OM = 0:0.005:pi;
X = exp(-j*OM'*n)*x;

fq = OM*fs/(2*pi);
figure(2);title('freq domain');
plot(fq,abs(X))
