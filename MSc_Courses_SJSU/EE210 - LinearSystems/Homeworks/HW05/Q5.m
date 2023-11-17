clear;
k = 2
x1 = ((2/5)*(1/(pi*k/5))*(sind(k*180/5))*(exp(-j*k*pi/5)))
x2 = ((4/5)*(1/(pi*k*2/5))*(sind(k*2*180/5))*(exp(-j*k*6*pi/5)))
x = x1 + x2

abs(x)
angle(x)
% k= 2
% 
% x = 3*(((sind(180*k/6))/(pi*k/6))^2)*(cosd(180*k/3))