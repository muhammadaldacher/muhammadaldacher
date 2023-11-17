clc; clear all;

n = randn(1,1000000);
%1 million samples
M_n = mean(n);

plot(n)
figure
hist(n,100)

N = fft(n,10000);
figure
plot(abs(N))

h = fir1(100,0.5,'low');
y = filter(h,1,n);
Y = fft(y,10000);
figure
plot(abs(Y))