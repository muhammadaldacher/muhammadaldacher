clc; clear all;
x = [1 2 3 4];
h = [3 -1 0 -2];
y = cconv(x,h,4)

X = DFT_calc(x);
H = DFT_calc(h);

Y = X.*H;
y2 = DFT_inv_calc(Y)