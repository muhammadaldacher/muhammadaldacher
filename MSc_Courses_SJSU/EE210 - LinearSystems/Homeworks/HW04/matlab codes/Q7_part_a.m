clc; clear all; close all;

% syms f t
% ex = exp(-j*2*pi*f*t);
% X = int(0.5*ex,t,2,8);
% H = int(2*ex,t,-10,-12);
% 
% Y = X*H;
% Y = simplify(Y)
% 
% subplot(2,1,1); fplot(abs(Y)); title('Magnitude(Y)'); axis([-10 10 -0.05 14])
% subplot(2,1,2); fplot(angle(Y)); title('Phase(Y)'); axis([-10 10 -3.5 3.5])

%----------------------------------------------------------------------------
syms f t
ex = exp(-j*2*pi*f*t);
X = int(1*ex,t,-10,-4);
H = int(1*ex,t,0,2);

Y = X*H;
Y = simplify(Y)

subplot(2,1,1); fplot(abs(Y)); title('Magnitude(Y)'); axis([-10 10 -0.05 14])
subplot(2,1,2); fplot(angle(Y)); title('Phase(Y)'); axis([-10 10 -3.5 3.5])