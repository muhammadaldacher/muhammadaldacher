% Notch Filter
clc; clear all; close all;
DC = 0.999;
NC = 0.9;
Th = 0.4*pi;
fs = 150;

OM = 0:0.001:pi;
%z = exp(j*OM);
syms z

N1 = z - NC*exp(j*Th);
N2 = z - NC*exp(-j*Th);
N12 = N1*N2;
CoeffN = double(coeffs(N12)); %coefficients of the equation
