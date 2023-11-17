clc; clear all; close all;

tstep=0.01;
tstart=-5;
tend=5;
t=tstart:tstep:tend;

%x1(t) Function
for m=1:1:length(t)
    if (t(m) >= -3)&&(t(m) <= 3)
        x1(m) = 2;
    else
        x1(m) = 0;
    end
end
figure; plot(t,x1);

%x2(t) Function
for m=1:1:length(t)
    if (t(m) >= -3)&&(t(m) <= 3)
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

%---------------------------------------------------