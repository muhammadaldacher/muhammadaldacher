clc; clear all;
x = [1 2 3];

%DFT N=3
X = fft(x); X=X'
%plot(real(X),imag(X),'o')

%FFT N=4
Y = fft(x,4); Y'
plot(real(Y),imag(Y),'o')

y = ifft(Y)

