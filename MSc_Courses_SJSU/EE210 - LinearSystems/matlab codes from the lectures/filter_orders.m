clc; clear all;

for n = 3:5:200
    n
    h = fir1(n,0.5,'low');
    freqz(h)
    pause(1);
end
