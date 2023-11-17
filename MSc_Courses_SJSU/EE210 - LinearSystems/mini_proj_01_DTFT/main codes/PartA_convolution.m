clc; clear all; close all;
 
x = ones(1,20);
h = ones(1,4)/4;
 
subplot(1,2,1); stem(x,'filled','Linewidth',1); 
title("x[n]","FontSize",20); axis([0 21 0 1.1]); grid on
subplot(1,2,2); stem(h,'filled','Linewidth',1); 
title("h[n]","FontSize",20); axis([0 5 0 0.26]); grid on
 
y1 = my_conv(x,h);
figure; hold on; grid on; title("y[n] using 'my\_conv' function","FontSize",20)
stem(y1,'^','filled','Linewidth',1); axis([0 25 0 1.1]);

y2 = conv(x,h);

figure; hold on; grid on;
stem(y1,'^','filled','Linewidth',1); 
stem(y2,'*','filled','Linewidth',1);
legend('y[n] from my\_conv function','y[n] from built-in conv',"FontSize",12)

y3 = filter(h,1,x);
figure; hold on; grid on;
stem(y1,'^','filled','Linewidth',1); 
stem(y3,'*','filled','Linewidth',1);
legend('y[n] using my\_conv function','y[n] using filter function',"FontSize",12)
