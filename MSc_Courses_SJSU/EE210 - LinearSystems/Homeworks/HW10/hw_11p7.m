clc; clear all; close all;

%DFT
N1 = 5;
n1 = 0:1:N1-1;
x1 = [3 -1 0 2 1];

X1 = fft(x1); X1 = transpose(X1)
figure(1)
subplot(1,2,1); stem(n1,abs(X1),'Linewidth',2); title('Magnitude of X_N_=_5(k)'); 
axis([-1 N1 0 max(abs(X1))+1])
subplot(1,2,2); stem(n1,angle(X1),'Linewidth',2); title('Phase of X_N_=_5(k)'); 
axis([-1 N1 min(angle(X1))-0.1 max(angle(X1))+0.1])

xx1 = ifft(X1)

%FFT
N2 = 8;
n2 = 0:1:N2-1;
x2 = [3 -1 0 2 1 0 0 0];

X2 = fft(x2); X2 = transpose(X2)
figure(2)
subplot(1,2,1); stem(n2,abs(X2),'Linewidth',2); title('Magnitude of X_N_=_8(k)'); 
axis([-1 N2 0 max(abs(X2))+1])
subplot(1,2,2); stem(n2,angle(X2),'Linewidth',2); title('Phase of X_N_=_8(k)'); 
axis([-1 N2 min(angle(X2))-0.1 max(angle(X2))+0.1])

xx2 = ifft(X2)

%DTFT
cnt=1;
for OM = 0:0.1:2*pi;   
    tmp =0;
    for indx = 0:length(x1)-1;
       tmp = tmp + x1(indx+1)*exp(-j*OM*indx); 
    end
    Xdtft(cnt) = tmp;
    OM_V(cnt) = OM;
    cnt = cnt+1;
end

figure(3)
subplot(1,2,1); plot(OM_V,abs(Xdtft),'Linewidth',2); title('Magnitude of X('+string(char(937))+')'); 
axis([0 (2*pi) 0 max(abs(Xdtft))+1]); grid on
subplot(1,2,2); plot(OM_V,angle(Xdtft),'Linewidth',2); title('Phase of X('+string(char(937))+')'); 
axis([0 (2*pi) min(angle(Xdtft))-0.1 max(angle(Xdtft))+0.1]); grid on

%----------------------------------------------------
%Comparison
figure; hold on; grid on;
n1_new = (n1*2*pi/N1);
stem(n1_new,abs(X1),'Linewidth',2);
n2_new = (n2*2*pi/N2);
stem(n2_new,abs(X2),'Linewidth',2);
plot(OM_V,abs(Xdtft),'Linewidth',2);
legend('X(k) from N=5 DFT','X(k) from N=8 DFT','X('+string(char(937))+') from DTFT')
