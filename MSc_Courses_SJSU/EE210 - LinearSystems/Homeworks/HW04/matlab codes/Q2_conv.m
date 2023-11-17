clc; clear all; close all;

tstart=-6; tstep=0.01; tend=6;
t=tstart:tstep:tend;

%x1(t) Function
for m=1:1:length(t)
    if (t(m) >= -2)&&(t(m) <= 0)
        x1(m) = t(m)^2;
    else
        x1(m) = 0;
    end
end
figure; plot(t,x1);

%x2(t) Function
for m=1:1:length(t)
    if (t(m) >= 4)&&(t(m) <= 5)
        x2(m) = (-3*t(m))+15;
    else
        x2(m) = 0;
    end
end
figure; plot(t,x2);

y = conv(x1,x2)
y = y.*tstep
t_2x=(tstart*2):tstep:(tend*2);
figure; plot(t_2x,y); title("y(t)");
