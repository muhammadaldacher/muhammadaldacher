clc; clear all;

N= 6;
n= 0:N-1;
k= n;

W = exp(-j*2*pi*k'*n/N)
%W = abs(W).*exp(j.*angle(W))