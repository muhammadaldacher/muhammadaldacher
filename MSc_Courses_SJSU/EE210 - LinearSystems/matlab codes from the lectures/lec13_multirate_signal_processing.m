clc; clear;
[x,fs] = audioread('ss.wav');
%whos

x = x';
fs
x = x(1,:); %one channel (there are 2 channels)
x1 = x(60*fs:65*fs);
% x = x(:,:); %both channels
% x1 = x(:,60*fs:65*fs);

h = fir1(100,22.05/4,'low');
x1 = filter(h,1/4,x1);
x2 = x1(1:4:end);
sound(x2,fs/2);

plot(x)
sound(x1,fs)

fs = fs/4;
OM = 0:0.1:
[X] = frq_res(x1,OM);

fq = OM*fs/(2*pi);
X_mag = abs(X);
plot(fq,X_mag)


