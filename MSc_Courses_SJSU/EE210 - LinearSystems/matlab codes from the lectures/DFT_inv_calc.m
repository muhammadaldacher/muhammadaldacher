function y = DFT_inv_calc(X)

N = length(X);
k = 0:N-1;
n=k;

y = (1/N)*exp(j*2*pi*k'*n/N)*X;