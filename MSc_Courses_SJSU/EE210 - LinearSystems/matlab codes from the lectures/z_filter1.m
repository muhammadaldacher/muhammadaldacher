% OM = -pi:0.01:pi;
% z = exp(j*OM);
% H = (z.^3 +1)./(z.^2.*(2.*z.^2 + z + 0.9));
% plot(OM,abs(H));

%-------------
% clc; clear; close all;
% OM = 0:0.001:pi;
% z = exp(j*OM);
% 
% % H1 = z./(z-0.9);
% % H2 = z./(z+0.9);
% H1 = (z-0.1)./(z-0.9);
% H2 = (z+0.8)./(z+0.9);
% H3 = z./((z-0.9*j).*(z+0.9*j));
% 
% figure; plot(OM,abs(H1))
% figure; plot(OM,abs(H2))
% figure; plot(OM,abs(H3))

%-------------
clc; clear; close all;
OM = 0:0.001:pi;
z = exp(j*OM);

% H1 = z./(z-0.9);
% H2 = z./(z+0.9);
H1 = (z-0.1)./(z-0.9);
H2 = (z-0.5)./(z-0.9);
H3 = (z-0.8)./(z-0.9);

plot(OM,abs(H1)); hold on
plot(OM,abs(H2))
plot(OM,abs(H3))



