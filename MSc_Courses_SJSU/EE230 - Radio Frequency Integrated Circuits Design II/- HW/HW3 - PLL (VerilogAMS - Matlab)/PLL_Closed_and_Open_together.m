clc; close all;
figure
Icp = 100e-6;
Kvco = 2*pi*600e6;
R1 = 4e3;
C1 = 200e-12;
C2 = C1/20;
M = 64;

%-------------------------------------------------------
% Open Loop Gain:
wz = 1 / (R1*C1)
w_ugb = wz * sqrt((C1/C2)+1);
wp3 = (C1 + C2) / (R1*C1*C2)
PM_Max = (atan(w_ugb/wz) - atan(w_ugb/wp3)) *360/(2*pi)
Const1 = (Icp*Kvco)/(2*pi*M*C1*C2*R1);

H = tf([C1*R1*Const1 Const1],[1 ((C1+C2)/(C1*C2*R1)) 0 0]);
bode(H)
[Gm,Pm,Wgm,Wpm] = margin(H);
Pm
hold on; grid on; title('Loop Gain Transfer function')
set(findall(gcf,'type','line'),'linewidth',2)

%-------------------------------------------------------
% To find the zero & pole accurately:
b = [C1*R1*Const1 Const1];
a = [1 ((C1+C2)/(C1*C2*R1)) 0 0];
fvtool(b,a,'polezero')
[b,a] = eqtflength(b,a);
[z,p,k] = tf2zp(b,a)            %<-- z = zero, p = pole

gain = db2mag(0);
wc = getGainCrossover(H,gain)   %<-- wc = unity-gain BW

%-------------------------------------------------------
% Closed Loop Gain:
figure

H = tf([(C1*R1*Const1*M) (M*Const1)],[1 ((C1+C2)/(C1*C2*R1)) (C1*R1*Const1) Const1]);
bode(H)
[Gm,Pm,Wgm,Wpm] = margin(H);

BW = (bandwidth(H))/(2*pi)
fz = wz / (2*pi)
fp = wp3 / (2*pi)
fc = wc / (2*pi)
hold on; grid on; title('Closed Loop Transfer function')
set(findall(gcf,'type','line'),'linewidth',2)