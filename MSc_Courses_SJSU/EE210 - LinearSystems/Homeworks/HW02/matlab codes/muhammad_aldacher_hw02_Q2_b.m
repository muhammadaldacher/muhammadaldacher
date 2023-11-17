clc; clear; close all;

%Creating Rectangular Function
A=2;
t=-6:0.01:6;

for m=1:1:length(t)
 if (t(m) >= -2)&&(t(m) <= 2)
     x(m) = A;
 else
     x(m) = 0;
 end
end
figure; subplot(2,2,1); plot(t,x); title('2*Rect(t/4)')
%----------------------------------

f=linspace(-5,5,length(t));

for k=1:1:length(f)
 X(k)=trapz(t,x.*exp(-j*2*pi*f(k)*t));
end

subplot(2,2,2); plot(f,X); title('FT of 2*Rect(t/4)')
subplot(2,2,3); plot(f,abs(X)); title('Magnitude')
subplot(2,2,4); plot(f,angle(X)); title('Phase')
%----------------------------------
%----------------------------------

for m=1:1:length(t)
 if (t(m) >= 1)&&(t(m) <= 5)
     y(m) = A;
 else
     y(m) = 0;
 end
end
figure; subplot(2,2,1); plot(t,y); title('2*Rect((t-3)/4)')
%----------------------------------

f=linspace(-5,5,length(t));

for k=1:1:length(f)
 Y(k)=trapz(t,y.*exp(-j*2*pi*f(k)*t));
end

subplot(2,2,2); plot(f,Y); title('FT of 2*Rect((t-3)/4)')
subplot(2,2,3); plot(f,abs(Y)); title('Magnitude')
subplot(2,2,4); plot(f,angle(Y)); title('Phase')

%----------------------------------
%----------------------------------

for m=1:1:length(t)
 if (t(m) >= -5)&&(t(m) <= -1)
     z(m) = A;
 else
     z(m) = 0;
 end
end
figure; subplot(2,2,1); plot(t,z); title('2*Rect((t+3)/4)')
%----------------------------------

f=linspace(-5,5,length(t));

for k=1:1:length(f)
 Z(k)=trapz(t,z.*exp(-j*2*pi*f(k)*t));
end

subplot(2,2,2); plot(f,Z); title('FT of 2*Rect((t+3)/4)')
subplot(2,2,3); plot(f,abs(Z)); title('Magnitude')
subplot(2,2,4); plot(f,angle(Z)); title('Phase')

