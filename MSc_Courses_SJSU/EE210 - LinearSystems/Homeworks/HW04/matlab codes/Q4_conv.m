clc; clear all; close all;

tstep=0.01;
tstart=-12;
tend=12;
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

%h1(t) Function
for m=1:1:length(t)
    if (t(m) >= 1)&&(t(m) <= 3)
        h1(m) = 2;
    else
        h1(m) = 0;
    end
end

%h2(t) Function
for m=1:1:length(t)
    if (t(m) >= 4.5)&&(t(m) <= 5.5)
        h2(m) = 2;
    else
        h2(m) = 0;
    end
end

%ya(t) Function
for m=1:1:length(t)
    if (t(m) >= 7)&&(t(m) <= 9)
        ya(m) = 2;
    else
        ya(m) = 0;
    end
end

y = conv(x1,h1) + conv(x1,h2)
y = y.*tstep;
t_2x=(tstart*2):tstep:(tend*2);

%ya(t) Function
for m=1:1:length(t_2x)
    if (t_2x(m) >= 7)&&(t_2x(m) <= 9)
        ya(m) = 2;
    else
        ya(m) = 0;
    end
end

y = y + ya;

figure; plot(t_2x,y)