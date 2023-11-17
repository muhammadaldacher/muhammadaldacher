% clc; clear all; close all;
% %Numerator 
% N= [1 -9];
% %Denominator
% D= conv([1 -1], [1 -2])
% 
% [r,p,k] = residue(N,D)

D = [2 1 0.9];
P = roots(D)
zplane(P)