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
[X, OM] = my_dtft(x);

X_mag = abs(X);
X_ph = angle(X);
freq = OM*fs/(2*pi);

figure; plot(freq,X_mag); title('Mag of X('+string(char(937))+')',"FontSize",20);
ylabel('|X('+string(char(937))+')|',"FontSize",14); xlabel('Freq (Hz)',"FontSize",14);
figure; plot(freq,X_ph); title('Phase of X('+string(char(937))+')',"FontSize",20);
ylabel('Phase(X('+string(char(937))+'))',"FontSize",14); xlabel('Freq (Hz)',"FontSize",14);

%----------------------------------------
% the FIR filters

h1 = fir1(100,500/8000,'low');
h2 = fir1(100,1000/8000,'low');
h3 = fir1(100,2000/8000,'low');
h4 = fir1(100,3000/8000,'low');

figure;
subplot(2,2,1);stem(h1); title('h1');
subplot(2,2,2);stem(h2); title('h2');
subplot(2,2,3);stem(h3); title('h3');
subplot(2,2,4);stem(h4); title('h4');

[H1, OM] = my_dtft(h1);
[H2, OM] = my_dtft(h2);
[H3, OM] = my_dtft(h3);
[H4, OM] = my_dtft(h4);

H1_mag = abs(H1); H1_ph = angle(H1);
H2_mag = abs(H2); H2_ph = angle(H2);
H3_mag = abs(H3); H3_ph = angle(H3);
H4_mag = abs(H4); H4_ph = angle(H4);
freq = OM*fs/(2*pi);

figure; 
subplot(1,2,1); plot(freq,H1_mag,'Linewidth',2); 
title('Mag of H1('+string(char(937))+')',"FontSize",20); grid on;
ylabel('|H1('+string(char(937))+')|',"FontSize",14); xlabel('Freq (Hz)',"FontSize",14);
subplot(1,2,2); plot(freq,H1_ph,'Linewidth',2); 
title('Phase of H1('+string(char(937))+')',"FontSize",20); grid on;
ylabel('Phase(H1('+string(char(937))+'))',"FontSize",14); xlabel('Freq (Hz)',"FontSize",14);

figure;
subplot(1,2,1); plot(freq,H2_mag,'Linewidth',2); 
title('Mag of H2('+string(char(937))+')',"FontSize",20); grid on;
ylabel('|H2('+string(char(937))+')|',"FontSize",14); xlabel('Freq (Hz)',"FontSize",14);
subplot(1,2,2); plot(freq,H2_ph,'Linewidth',2); 
title('Phase of H2('+string(char(937))+')',"FontSize",20); grid on;
ylabel('Phase(H2('+string(char(937))+'))',"FontSize",14); xlabel('Freq (Hz)',"FontSize",14);

figure; grid on;
subplot(1,2,1); plot(freq,H3_mag,'Linewidth',2); 
title('Mag of H3('+string(char(937))+')',"FontSize",20); grid on;
ylabel('|H3('+string(char(937))+')|',"FontSize",14); xlabel('Freq (Hz)',"FontSize",14);
subplot(1,2,2); plot(freq,H3_ph,'Linewidth',2); 
title('Phase of H3('+string(char(937))+')',"FontSize",20); grid on;
ylabel('Phase(H3('+string(char(937))+'))',"FontSize",14); xlabel('Freq (Hz)',"FontSize",14);

figure; grid on;
subplot(1,2,1); plot(freq,H4_mag,'Linewidth',2); 
title('Mag of H4('+string(char(937))+')',"FontSize",20); grid on;
ylabel('|H4('+string(char(937))+')|',"FontSize",14); xlabel('Freq (Hz)',"FontSize",14);
subplot(1,2,2); plot(freq,H4_ph,'Linewidth',2); 
title('Phase of H4('+string(char(937))+')',"FontSize",20); grid on;
ylabel('Phase(H4('+string(char(937))+'))',"FontSize",14); xlabel('Freq (Hz)',"FontSize",14);

%----------------------------------------
% Convolution

y1 = my_conv(x',h1); sound(y1,fs);
y2 = my_conv(x',h2); sound(y2,fs);
y3 = my_conv(x',h3); sound(y3,fs);
y4 = my_conv(x',h4); sound(y4,fs);

figure; plot(y1);title('y1 in time domain',"FontSize",20); grid on;
ylabel('y1',"FontSize",14); xlabel('samples',"FontSize",14);
figure; plot(y2);title('y2 in time domain',"FontSize",20); grid on;
ylabel('y2',"FontSize",14); xlabel('samples',"FontSize",14);
figure; plot(y3);title('y3 in time domain',"FontSize",20); grid on;
ylabel('y3',"FontSize",14); xlabel('samples',"FontSize",14);
figure; plot(y4);title('y4 in time domain',"FontSize",20); grid on;
ylabel('y4',"FontSize",14); xlabel('samples',"FontSize",14);

[Y1, OM] = my_dtft(y1);
[Y2, OM] = my_dtft(y2);
[Y3, OM] = my_dtft(y3);
[Y4, OM] = my_dtft(y4);

Y1_mag = abs(Y1); Y1_ph = angle(Y1);
Y2_mag = abs(Y2); Y2_ph = angle(Y2);
Y3_mag = abs(Y3); Y3_ph = angle(Y3);
Y4_mag = abs(Y4); Y4_ph = angle(Y4);
freq = OM*fs/(2*pi);

figure; 
subplot(1,2,1); plot(freq,Y1_mag); 
title('Mag of Y1('+string(char(937))+')',"FontSize",20); grid on;
ylabel('|Y1('+string(char(937))+')|',"FontSize",14); xlabel('Freq (Hz)',"FontSize",14);
subplot(1,2,2); plot(freq,Y1_ph); 
title('Phase of Y1('+string(char(937))+')',"FontSize",20); grid on;
ylabel('Phase(Y1('+string(char(937))+'))',"FontSize",14); xlabel('Freq (Hz)',"FontSize",14);

figure;
subplot(1,2,1); plot(freq,Y2_mag); 
title('Mag of Y2('+string(char(937))+')',"FontSize",20); grid on;
ylabel('|Y2('+string(char(937))+')|',"FontSize",14); xlabel('Freq (Hz)',"FontSize",14);
subplot(1,2,2); plot(freq,Y2_ph); 
title('Phase of Y2('+string(char(937))+')',"FontSize",20); grid on;
ylabel('Phase(Y2('+string(char(937))+'))',"FontSize",14); xlabel('Freq (Hz)',"FontSize",14);

figure; grid on;
subplot(1,2,1); plot(freq,Y3_mag); 
title('Mag of Y3('+string(char(937))+')',"FontSize",20); grid on;
ylabel('|Y3('+string(char(937))+')|',"FontSize",14); xlabel('Freq (Hz)',"FontSize",14);
subplot(1,2,2); plot(freq,Y3_ph); 
title('Phase of Y3('+string(char(937))+')',"FontSize",20); grid on;
ylabel('Phase(Y3('+string(char(937))+'))',"FontSize",14); xlabel('Freq (Hz)',"FontSize",14);

figure; grid on;
subplot(1,2,1); plot(freq,Y4_mag); 
title('Mag of Y4('+string(char(937))+')',"FontSize",20); grid on;
ylabel('|Y4('+string(char(937))+')|',"FontSize",14); xlabel('Freq (Hz)',"FontSize",14);
subplot(1,2,2); plot(freq,Y4_ph); 
title('Phase of Y4('+string(char(937))+')',"FontSize",20); grid on;
ylabel('Phase(Y4('+string(char(937))+'))',"FontSize",14); xlabel('Freq (Hz)',"FontSize",14);
