clc; clear all; close all;

syms f t
ex = exp(-j*2*pi*f*t);
x1 = 2;
X1 = int(x1*ex,t,-3,3);

x2 = 2; 
X2 = int(x2*ex,t,-3,3);

Y = X1*X2;
Y = simplify(Y)

subplot(2,1,1); fplot(abs(Y)); title('Magnitue(Y)'); axis([-10 10 -0.05 150])
subplot(2,1,2); fplot(angle(Y)); title('Phase(Y)'); axis([-10 10 -3.5 3.5])

