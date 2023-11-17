function Y = DFT_calc(x)

N = length(x);
n = 0:N-1;
k = n;

Y = exp(-j*2*pi*k'*n/N)*x';