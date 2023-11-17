clc; clear all; close all;

f = -100:0.01:100;
Y = (32.*(sinc(2.*f)).*(sinc(4.*f))) ...
    - (8.*(sinc(f)).*(sinc(4.*f)).*(exp(j.*pi.*f))) ...
    - (4.*(sinc(2.*f)).*(sinc(f)).*(exp(-j.*3.*pi.*f))) ...
    + ((sinc(f)).^2).*(exp(-j.*2.*pi.*f))

figure; plot(f,abs(Y))
figure; plot(f,abs(Y)); axis([-6 6 -0.05 21])
figure; plot(angle(Y)); axis([-6 6 -0.05 0.5])