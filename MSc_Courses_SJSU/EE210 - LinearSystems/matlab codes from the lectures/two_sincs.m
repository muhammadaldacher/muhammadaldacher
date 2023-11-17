% clc; clear;
% 
% f = -10:0.1:10;
% X1 = 2*sinc(2*f).*8.*sinc(4*f).*exp(-j*4*pi*f);
% 
% plot(f,abs(X1))

%----------------------------------------------

clc; clear all; close all;

syms f t
ex = exp(-j*2*pi*f*t);
x1 = (2*t)+2;
X1 = int(x1*ex,t,-1,1);

x2 = 4;
X2 = int(x2*ex,t,1,3);

x3 = (-2*t)+10;
X3 = int(x3*ex,t,3,5);

X = X1+X2+X3;
% Y = simplify(X)
% Y = pretty(Y)

% f = -10:0.13:10;
% Y = subs(X,f);
% Y = double(Y);
% plot(f,abs(Y))

