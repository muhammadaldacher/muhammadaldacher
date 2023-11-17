clc; clear all; close all;

syms f t
ex = exp(-j*2*pi*f*t);
x1 = 3;
X1 = int(x1*ex,t,-1,2);

x2 = 2; 
X2 = int(x2*ex,t,-1.5,1.5);

Y = X1*X2;
Y = simplify(Y)

subplot(2,1,1); fplot(abs(Y)); title('Magnitue(Y)'); axis([-10 10 -0.05 58])
subplot(2,1,2); fplot(angle(Y)); title('Phase(Y)'); axis([-10 10 -3.5 3.5])

