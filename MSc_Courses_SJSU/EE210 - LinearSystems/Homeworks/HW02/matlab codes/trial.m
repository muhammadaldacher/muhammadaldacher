f = -5:0.01:5;
X = 8*sinc(4*f).*exp(-j*6*pi*f);
plot(f,angle(X))