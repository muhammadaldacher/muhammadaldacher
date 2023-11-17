clc; clear all; close all;
tstep=0.01;
tstart=-3;
tend=3;
t=tstart:tstep:tend;

%x1(t) Function
for m=1:1:length(t)
    if (t(m) >= 0)&&(t(m) <= 2)
        x1(m) = 1;
    else
        x1(m) = 0;
    end
end
figure; plot(t,x1);

%x2(t) Function
for m=1:1:length(t)
    if (t(m) >= -1)&&(t(m) <= 2)
        x2(m) = 2;
    else
        x2(m) = 0;
    end
end
figure; plot(t,x2);

y = conv(x1,x2)
y = y.*tstep
t_2x=(tstart*2):tstep:(tend*2);
figure; plot(t_2x,y)

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
