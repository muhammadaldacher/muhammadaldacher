clc; clear all; 

f = -100:0.01:100;
Y = (8.*(sinc(2.*f)).*(sinc(2.*f)).*(exp(-j.*6.*pi.*f))) ...
    + (4.*(sinc(2.*f)).*(sinc(f)).*(exp(-j.*12.*pi.*f))) ...
    + (4.*(sinc(2.*f)).*(exp(-j.*16.*pi.*f)))

figure; plot(f,abs(Y))
figure; plot(f,abs(Y)); axis([-6 6 -0.05 1.1])
figure; plot(angle(Y)); axis([-6 6 -3.4 3.4])