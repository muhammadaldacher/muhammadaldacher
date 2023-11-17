syms x
fplot(sin(x+pi/5),'Linewidth',2)
hold on
fplot(sin(x-pi/5),'--or')
fplot(sin(x),'-.*c')
legend('show','Location','best')
hold off