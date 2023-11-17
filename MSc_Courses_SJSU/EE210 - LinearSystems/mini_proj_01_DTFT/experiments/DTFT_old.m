clc;clear all; close all;

[z,fs] = audioread('MiniProject01.wav');
% sound(z,fs)

%----------------------------------------
% Resampling to fs = 16KHz

x = resample(z,16000,fs);
fs = 16000;
audiowrite('newaudio.wav',x,fs)
[x,fs] = audioread('newaudio.wav');
t=0:(1/fs):(length(x)/fs); t=t(1:end-1);
% sound(x,fs)
figure; plot(t,x);title('x (my voice) in time domain',"FontSize",20); grid on;
ylabel('x(t)',"FontSize",14); xlabel('time (seconds)',"FontSize",14);

figure; plot(x);title('x (my voice) in time domain',"FontSize",20); grid on;
ylabel('x[n]',"FontSize",14); xlabel('samples',"FontSize",14);

%----------------------------------------
% Performing DTFT

cnt=1;

for my_OM = 0:0.001:pi;
    my_x =0;
    
    for n = 1:length(x);
       my_x = my_x + x(n)*exp(-j*my_OM*n); 
    end
    
    X(cnt) = my_x;
    OM(cnt) = my_OM;
    cnt = cnt+1;
end

X_mag = abs(X);
X_ph = angle(X);
freq = OM*fs/(2*pi);

figure; plot(freq,X_mag); title('Mag of X('+string(char(937))+')',"FontSize",20);
ylabel('|X('+string(char(937))+')|',"FontSize",14); xlabel('Freq (Hz)',"FontSize",14);
figure; plot(freq,X_ph); title('Phase of X('+string(char(937))+')',"FontSize",20);
ylabel('Phase(X('+string(char(937))+'))',"FontSize",14); xlabel('Freq (Hz)',"FontSize",14);

%----------------------------------------
% Using the FIR filters

h1 = fir1(100,500/8000,'low');
h2 = fir1(100,1000/8000,'low');
h3 = fir1(100,2000/8000,'low');
h4 = fir1(100,3000/8000,'low');

subplot(2,2,1);stem(h1); title('h1');
subplot(2,2,2);stem(h2); title('h2');
subplot(2,2,3);stem(h3); title('h3');
subplot(2,2,4);stem(h4); title('h4');


