clc; clear all; close all;

x1 = [4 3 2 1];     N1 = length(x1);
x2 = [x1 x1];       N2 = length(x2);
x3 = [x1 x1 x1];    N3 = length(x3);

n1 = 0:1:((N1)-1);
n2 = 0:1:((N2)-1);
n3 = 0:1:((N3)-1);

%DFT 
X1 = fft(x1); X1 = transpose(X1);
X2 = fft(x2); X2 = transpose(X2);
X3 = fft(x3); X3 = transpose(X3);

figure(1)
subplot(1,2,1); stem(n1,abs(X1),'Linewidth',2); title('Magnitude of X1'); 
axis([-1 N1 0 max(abs(X1))+1])
subplot(1,2,2); stem(n1,angle(X1),'Linewidth',2); title('Phase of X1'); 
axis([-1 N1 min(angle(X1))-0.1 max(angle(X1))+0.1])

figure(2)
subplot(1,2,1); stem(n2,abs(X2),'Linewidth',2); title('Magnitude of X2'); 
axis([-1 N2 0 max(abs(X2))+1])
subplot(1,2,2); stem(n2,angle(X2),'Linewidth',2); title('Phase of X2'); 
axis([-1 N2 min(angle(X2))-0.1 max(angle(X2))+0.1])

figure(3)
subplot(1,2,1); stem(n3,abs(X3),'Linewidth',2); title('Magnitude of X3'); 
axis([-1 N3 0 max(abs(X3))+1])
subplot(1,2,2); stem(n3,angle(X3),'Linewidth',2); title('Phase of X3'); 
axis([-1 N3 min(angle(X3))-0.1 max(angle(X3))+0.1])

%figure; hold on; stem(abs(X1)); stem(abs(X2)); stem(abs(X3));
%figure; hold on; stem(angle(X1)); angle(abs(X2)); angle(abs(X3));

xx1 = ifft(X1);
xx2 = ifft(X2);
xx3 = ifft(X3);