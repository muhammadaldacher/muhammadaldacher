clc; clear all; close all;

syms f t
ex = exp(-j*2*pi*f*t);
x1 = 3;
X1 = int(x1*ex,t,1,3);

x2 = 2*triangularPulse(1,3,t);
X2 = int(x2*ex,t,1,3);

Y = X1 + X2;
Y = simplify(Y)
subplot(2,1,1); fplot(abs(Y)); title('Magnitue(Y)'); axis([-5 5 -0.05 10]); grid on;
subplot(2,1,2); fplot(angle(Y)); title('Phase(Y)'); axis([-5 5 -3.5 3.5]); grid on;

%--------------------------------------------------------------------------

% clc; clear all; close all;
% 
% syms f;
% Y = ((6.*(sinc(2.*f)))+(4.*sinc(2.*f).*sinc(2.*f))).*(exp(-j.*4.*pi.*f))
% 
% figure; fplot(f,abs(Y))
% subplot(2,1,1); fplot(f,abs(Y)); axis([-6 6 -0.05 11]); title('Magnitue(X)');
% subplot(2,1,2); fplot(angle(Y)); axis([-6 6 -3.4 3.4]); title('Phase(X)');