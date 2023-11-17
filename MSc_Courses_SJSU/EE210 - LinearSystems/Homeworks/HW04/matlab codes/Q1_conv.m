clc; clear all; close all;

tstep=0.01; tstart=-3; tend=3;
t=tstart:tstep:tend;

%x1(t) Function
for m=1:1:length(t)
    if (t(m) >= -1)&&(t(m) <= 0)
        x1(m) = 1;
    elseif (t(m) > 0)&&(t(m) <= 1)
        x1(m) = 2;
    else
        x1(m) = 0;
    end
end
subplot(1,3,1); plot(t,x1); axis([-2 2 -0.05 2.05]); title("x1(t)"); grid on;

%x2(t) Function
for m=1:1:length(t)
    if (t(m) >= -2)&&(t(m) <= 1)
        x2(m) = 2;
    elseif (t(m) > 1)&&(t(m) <= 2)
        x2(m) = 1;
    else
        x2(m) = 0;
    end
end
subplot(1,3,2); plot(t,x2); axis([-3 3 -0.05 2.05]); title("x2(t)"); grid on;

y = conv(x1,x2)
y = y.*tstep
t_2x=(tstart*2):tstep:(tend*2);
subplot(1,3,3); plot(t_2x,y); axis([-4 4 -0.05 6.05]); title("y(t)"); grid on;
%------------------
% fs = 6000; %has to be 2 times the biggest freq component
% n = fs.*t;
% 
% OM = 0:0.005:pi;
% 
% Y = exp(-j*OM'*n)*y';
% fq = OM*fs/(2*pi);
% figure;
% plot(fq,abs(Y))
% figure;
% plot(fq,angle(Y))
% 
