clc; clear all; close all;

syms f t
ex = exp(-j*2*pi*f*t);
x = 1;
X = int(x*ex,t,0,2);

h1 = 2;
H1 = int(h1*ex,t,1,3);

h2 = 2;
H2 = int(h2*ex,t,4.5,5.5);

ya = 2;
Ya = int(ya*ex,t,7,9);

Y = (X*H1)+(X*H2)+Ya;
Y = simplify(Y)
subplot(2,1,1); fplot(abs(Y)); title('Magnitue(Y)');
subplot(2,1,2); fplot(angle(Y)); title('Phase(Y)');