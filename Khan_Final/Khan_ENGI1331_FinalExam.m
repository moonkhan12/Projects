%% Final Exam - ENGI 1331 

%Name: Mubashar Khan
%Cougatnet Username: mmkhan8
%Student ID: 1512949

% Last Update: May 2, 2017
% Last Update: May 2, 2017

%% Problem #1
clear
clc
close all

Background = imread('image2.jpg');
Boat = imread('image1.jpg');

[Matrix, numPix] = QuadImage(Background,Boat);

figure(1)
image(Matrix)
Name = sprintf('New Image contains %d pixels',numPix);
title(Name)

imwrite(Background,'NewImage.png');


%% Problem #2

clear
clc
close all

ExperimentalData = csvread('Data1.csv');

x = ExperimentalData(:,1);
yUpper = ExperimentalData(:,2);
yLower = ExperimentalData(:,3);

upperEquation = polyfit(x,yUpper,1);
m1 = upperEquation(1);
b1 = upperEquation(2);

y1 = @(x) m1.*x + b1; %line equ

lowerEquation = polyfit(log10(x),log10(yLower),1);
m2 = lowerEquation(1);
b2 = 10^lowerEquation(2);

y2 = @(x) b2 .* x.^m2; % power equa


%intersect1 = fzero((y1-y2),200);

intersect = 218.97; %Just to continue
fprintf('Intersection point occurs at %0.2f K',intersect)

ystart = y2(intersect);
yfinish =  y2(280);

xrange = (intersect:.01:280);
yrange = (y2(280):.01:y1(280));
figure(1)
plot(xrange,y2(xrange),'-b','LineWidth',2)
hold on
plot(xrange,y1(xrange),'-b','LineWidth',2)

plot([280,280],[y1(280),y2(280)],'-b','LineWidth',2)

axis([200,320,0,1000])
xlabel('Temperature (T) [K]')
ylabel('Pressure (P) [Pa]')
title('Phase diagram for unknown substance')
text(260,400,'Liquid','Color','b')


a1 = integral(y1,intersect,280);
a2 = integral(y2,intersect,280);
area = a1 - a2;

totalarea = 1000 * (320 - 200);

liquidArea = area/totalarea .* 100 ;

fprintf('\nFor the region shown, the percent area shown in the liquid state is %0.2f.',liquidArea)

PhaseData = csvread('Data2.csv');
[row, col] = size(PhaseData);

temp = PhaseData(:,1);
pres = PhaseData(:,2);
fprintf('\n\nTemperature [K] Pressure [Pa]\tPhase')
for i = 1:row
    fprintf('\n%0.0f\t\t\t\t%0.0f\t\t\t\t',temp(i),pres(i))
    if temp(i) < intersect || temp(i) > 280
        fprintf('non-liquid')
    elseif pres(i) > y1(temp(i)) || pres(i) < y2(temp(i))
        fprintf('non-liquid')
    else
        fprintf('liquid')
    end
    plot(temp(i),pres(i),'or','MarkerFaceColor','r','MarkerSize',10)
end


