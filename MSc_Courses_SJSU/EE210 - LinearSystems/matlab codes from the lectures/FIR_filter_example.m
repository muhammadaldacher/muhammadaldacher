clc; clear all;
k = 1000;
PB = 2*k;
SB = 3*k;
SBA = 40;
fs = 10*k;

TW = SB - PB ;
f1 = PB + TW/2 ;

N = round(3.32*fs/TW);
if(mod(N,2)==0)
	N = N+1; %to get odd number
end

n = ceil(-N/2):floor(N/2);

OM1 = 2*pi*f1/fs;
h1 = sin(n*OM1)/(n*pi);
h1(ceil(N/2)) = 0.5;
stem(n,h1);

w = 0.5 + (0.5*cos((2*pi*n)/(N-1)));

h = h1.*w;
n = 0:N-1;
stem(n,h);

freqz(h)

%====================
%High-Pass Filter
hg = h.*cos(n*pi);
freqz(hg)

%====================
%High-Pass Filter
hg = h.*cos(n*pi);
freqz(hg)


