function [y] = my_conv(x,h)
Nx = length(x);
Nh = length(h);

x = [x zeros(1,Nh-1)];
h = [h zeros(1,Nx-1)];
count = 1;

for i = 1: Nx+Nh-1;
    y(i)=0;
    for j = 1:i;
        y(i)=y(i)+(x(j)*h(i-j+1)); 
    end
end
