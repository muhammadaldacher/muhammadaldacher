clc; clear;
OM = 0:0.001: pi;
z = exp(j*OM)

X = z./(z-0.5);

X_mag = abs(X);
X_ph = angle(X);

plot(OM,X_mag);
figure;
plot(OM,X_ph);