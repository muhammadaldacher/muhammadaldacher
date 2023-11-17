clc; clear all; close all;

syms f t
ex = exp(-j*2*pi*f*t);
x1a = 1; x1b = 2;
X1 = int(x1a*ex,t,-1,0)+int(x1b*ex,t,0,1);

x2a = 2; x2b = 1;
X2 = int(x2a*ex,t,-2,1)+int(x2b*ex,t,1,2);

Y = X1*X2;
Y = simplify(Y)
subplot(2,1,1); fplot(f,abs(Y)); axis([-6 6 -0.08 22]); title('Magnitue(Y)'); grid on;
subplot(2,1,2); fplot(angle(Y)); axis([-6 6 -3.5 3.5]); title('Phase(Y)'); grid on;