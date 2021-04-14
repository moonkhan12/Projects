clear
clc
close all

t = [3.6 5.5 10.7 16.3 24.1 28 35]; 
H = [1.4 1.9 4.1 9.5 30.5 54.7 156.3];

%Goodness of fit
%Gof = fit(t,H,'poly2');

figure(1)
plot(t,H,'pk','MarkerFaceColor','k','MarkerSize',10)
axis([0 40 -10 160])
title('Roller Coaster Safety')
xlabel('Time (t) [s]')
ylabel('Height (H) [m]')
grid

%Linear fit
Linear_Fit = polyfit(t,H,1);
m = Linear_Fit(1);
b = Linear_Fit(2);

xline = (min(t):max(t));
yline = m * xline + b; % y = mx + b
% Add theoretical data series to graph
hold on
plot(xline,yline,'-r','LineWidth',1)


line_Label = sprintf('H = %0.2f t + %0.2f',m,b);
text(5,60,line_Label,'BackgroundColor','w','Color','r','EdgeColor','r','FontSize',14)


%Powerfit
power_Fit = polyfit(log10(t),log10(H),1);
m = power_Fit(1);
b = 10^power_Fit(2);

xmin = min(t);
xmax = max(t);

xpower = (xmin:0.1:xmax);
ypower = b * xpower.^m;

hold on
plot(xpower,ypower,'--b','LineWidth',1)

power_label = sprintf('H = %0.2f * t^{%0.2f}',b,m);
text(5,80,power_label,'BackgroundColor','w','Color','b','EdgeColor','b','FontSize',14)

%Exponential fit

exp_fit = polyfit(t,log(H),1);
m = exp_fit(1);
b = exp(exp_fit(2));

xexp = (0:35);
yexp = b * exp(m*xexp);

hold on
plot(xexp,yexp,':m','markersize',14)

exp_Label = sprintf('H = %0.2f*e^{%0.2f*t}',b,m);
text(5,100,exp_Label,'BackgroundColor','w','Color','m','EdgeColor','m','FontSize',14)



