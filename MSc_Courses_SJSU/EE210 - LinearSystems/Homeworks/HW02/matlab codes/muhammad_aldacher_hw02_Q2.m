clc; clear; close all;

syms t f
A = 2
%Fourier Transform of rectangular function
%Y=integrating(A*exp(-j*2*pi*f*t)) from t = -2 to +2
X=int((A*exp(-j*2*pi*f*t)),t,-2,2);

figure(1)
subplot(2,2,1); fplot(X); title('FT of 2*Rect(x/4)'); xlim([-5 5])
legend('show','Location','best')

subplot(2,2,3); fplot(abs(X)); title('Magnitude'); axis([-5 5 0 9])
subplot(2,2,4); fplot(angle(X)); title('Phase'); axis([-5 5 -3.3 3.3])
%----------------------------------------------------

% hold on
Y=int((A*exp(-j*2*pi*f*t)),t,1,5);
Z=int((A*exp(-j*2*pi*f*t)),t,-5,-1);

figure(2)
subplot(1,2,1); fplot(abs(X)); title('Magnitude'); axis([-5 5 0 9])
subplot(1,2,2); fplot(angle(X)); title('Phase'); axis([-5 5 -3.3 3.3])
figure(3)
subplot(1,2,1); fplot(abs(Y)); title('Magnitude'); axis([-5 5 0 9])
subplot(1,2,2); fplot(angle(Y)); title('Phase'); axis([-5 5 -3.3 3.3])
figure(4)
subplot(1,2,1); fplot(abs(Z)); title('Magnitude'); axis([-5 5 0 9])
subplot(1,2,2); fplot(angle(Z)); title('Phase'); axis([-5 5 -3.3 3.3])

figure(5) %Magnitudes
hold on
fplot(abs(X)); fplot(abs(Y),'-o'); fplot(abs(Z),'-*','Color','#77AC30'); 
title({'FT of 2*Rect(x/4)','Magnitude'}); axis([-5 5 0 9]); legend('x=(t)','x=(t-3)','x=(t+3)')

figure(6) %Phases
hold on
fplot(angle(X)); fplot(angle(Y),'-'); fplot(angle(Z),'-','Color','#77AC30'); 
title({'FT of 2*Rect(x/4)','Phase'}); axis([-5 5 -3.3 3.3]); legend('x=(t)','x=(t-3)','x=(t+3)')