function [X] = frq_res(x,OM)
N = length(x);
n = 0:N-1;

X = exp(-j*OM'*n)*x';