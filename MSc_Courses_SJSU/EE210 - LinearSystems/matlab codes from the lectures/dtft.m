clc; clear; close all;

f = 50;
fs = 40; % Aliasing

% f = 50;
% fs = 120; % No Aliasing

n = 0:(2*fs)-1;
x=sin(2*pi*f*(n/fs));

cnt=1;

% for OM = 0:0.001:pi;
for OM = -pi:0.001:pi;    
    tmp =0;
    
    for indx = 0:(2*fs)-1;
       tmp = tmp + x(indx+1)*exp(-j*OM*indx); 
    end
    X(cnt) = tmp;
    OM_V(cnt) = OM;
    cnt = cnt+1;
end

X_mag = abs(X);
freq = OM_V*fs/(2*pi);

plot(freq,X_mag)