clc;clear all; close all;

%These are Sinc functions in time-domain,
%which means they are window functions in freq-domain. 
h1 = fir1(100,500/8000,'low');
h2 = fir1(100,1000/8000,'low');
h3 = fir1(100,2000/8000,'low');
h4 = fir1(100,3000/8000,'low');

subplot(2,2,1);stem(h1); title('h1[n]','Linewidth',1); grid on;
subplot(2,2,2);stem(h2); title('h2[n]','Linewidth',1); grid on;
subplot(2,2,3);stem(h3); title('h3[n]','Linewidth',1); grid on;
subplot(2,2,4);stem(h4); title('h4[n]','Linewidth',1); grid on;

figure; freqz(h1); title('h1');
figure; freqz(h2); title('h2');
figure; freqz(h3); title('h3');
figure; freqz(h4); title('h4');