clc; clear all; close all;

%DFT
N = 4;
n = 0:1:N-1;
x = exp(-0.5*n);

%DFT N=4
X = fft(x); X = transpose(X);
figure(1)
subplot(1,2,1); stem(n,abs(X),'Linewidth',2); title('Magnitude of X(k)'); 
axis([-1 N 0 max(abs(X))+1])
subplot(1,2,2); stem(n,angle(X),'Linewidth',2); title('Phase of X(k)'); 
axis([-1 N min(angle(X))-0.1 max(angle(X))+0.1])

xx = ifft(X)

%----------------------------------------------------
%DTFT
cnt=1;
for OM = 0:0.1:2*pi;   
    tmp =0;
    for indx = 0:3;
       tmp = tmp + x(indx+1)*exp(-j*OM*indx); 
    end
    Xdtft(cnt) = tmp;
    OM_V(cnt) = OM;
    cnt = cnt+1;
end

figure(2)
subplot(1,2,1); plot(OM_V,abs(Xdtft),'Linewidth',2); title('Magnitude of X('+string(char(937))+')'); 
axis([0 (2*pi) 0 max(abs(Xdtft))+1]); grid on
subplot(1,2,2); plot(OM_V,angle(Xdtft),'Linewidth',2); title('Phase of X('+string(char(937))+')'); 
axis([0 (2*pi) min(angle(Xdtft))-0.1 max(angle(Xdtft))+0.1]); grid on

%----------------------------------------------------
%Comparison
figure; hold on; grid on;
n_new = (n*2*pi/N);
stem(n_new,abs(X),'Linewidth',2);
plot(OM_V,abs(Xdtft),'Linewidth',2);
legend('X(k) from DFT','X('+string(char(937))+') from DTFT')


