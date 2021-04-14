clear
clc
close all

%Problem Statement: Create a program that will analyze data on provided by
%a data file and generate the Riemann Sums.


%Input Variables: 
Data = csvread('area_data.csv');

num_Rect = input('Enter the number of rectangles you want to use for the area calculations: '); 
[r, c] = size(Data);
info = zeros(r,7); %Creates a r by 5 matrix filled with 0's for later use

for i = 1:r
% Formulas: 
% fn1(t) = At^2 +Bt + C
% fn2(t) = Mt + N
% fn3(t) = Zt + W
% where [A,B,C,M,N,Z,W] correspond to columns [1,2,3,4,5,6,7] of the data file. 
A = (Data(i,1));
B = (Data(i,2));
C = (Data(i,3));
M = (Data(i,4));
N = (Data(i,5));
Z = (Data(i,6));
W = (Data(i,7));
t0 = 0;
t1 = 3;
t = (0:.1:3);


%Assumptions:
%The user provided a data set which also has 7 columns


%Calculations:
%Look at Compute_area
[Answer1] = fn1(t,A,B,C);
[Answer2] = fn2(t,M,N);
[Answer3] = fn3(t,Z,W);

check_zero = @(t) fn1(t,A,B,C);
x = fzero(check_zero,2);

%Calling Compute_Area
[area1,area2,area3,Left_sum1,Right_sum1,Midpoint1,Left_sum2,Right_sum2,Midpoint2,Left_sum3,Right_sum3,Midpoint3] = Compute_area(t0,t1,A,B,C,M,N,Z,W,num_Rect,x);

info(i,1) = area1; %Stores all area values for function 1
info(i,2) = area2; %Stores all area values for function 2
info(i,3) = area3; %Stores all area values for function 3
info(i,4) = Left_sum1; %Stores all values for Left Riemann Sum
info(i,5) = Right_sum1; %Stores all vaules for the Right Riemann Sum
info(i,8) = Midpoint1; %Stores the calulated midpoint
info(i,9) = Left_sum2;
info(i,10) = Right_sum2;
info(i,11) = Midpoint2;
info(i,12) = Left_sum3;
info(i,13) = Right_sum3;
info(i,14) = Midpoint3;

%Output Variables:
%info = displays all relevant information

%Output:

%Graphs: 
figure(i) %Creates a new plot for each row of data. If you comment this liine out all functions will appear on one graph 
plot(t,Answer1,'-r')
hold on
plot(t,Answer2,'-b')
plot(t,Answer3,'-k')
axis([0,3,0,10])
title('Plot of functions fn1, fn2 and fn3 vs. t')
xlabel('Variable [t]')
ylabel('Functions Fn [y]')

%Intersections: 
%I decided to do intersections here because I kept encountering errors
%using a function file to find intersections. 
loc1_at_zero = @(t) fn1(t,A,B,C)-fn2(t,M,N);
loc2_at_zero = @(t) fn1(t,A,B,C)-fn3(t,Z,W);

%Find the intersection points of fn1 and fn2 and mark them
x1_fn2 = fzero(loc1_at_zero,0);
x2_fn2 = fzero(loc1_at_zero,2);
y1_fn2 = fn2(x1_fn2,M,N);
y2_fn2 = fn2(x2_fn2,M,N);
plot(x1_fn2,y1_fn2,'ok','MarkerFaceColor','k','MarkerSize',3) %This was
%used to check the location of (x1_fn2,y1_fn2)
text(x1_fn2+.05,y1_fn2+.3,'1')
plot(x2_fn2,y2_fn2,'ok','MarkerFaceColor','k','MarkerSize',3) %This was
%used to check the location of (x2_fn2,y2_fn2)
text(x2_fn2-.12,y2_fn2+.4,'3')

%Create a fill for bonus points:
color1 = fill([x1_fn2,x1_fn2,x2_fn2,x2_fn2],[0,y1_fn2,y2_fn2,0],'g');
set(color1,'facealpha',.5);

%Find the intersection points of fn1 and fn3 and mark them
x1_fn3 = fzero(loc2_at_zero,0);
x2_fn3 = fzero(loc2_at_zero,2);
y1_fn3 = fn3(x1_fn3,Z,W);
y2_fn3 = fn3(x2_fn3,Z,W);
plot([x1_fn3,x2_fn3],[y1_fn3,y2_fn3],'ok','MarkerFaceColor','k','MarkerSize',3)
%This was used to check the location of [x1_fn3,x2_fn3],[y1_fn3,y2_fn3]
text(x1_fn3-.05,y1_fn3+.3,'2')
text(x2_fn3+.03,y2_fn3+.3,'4')

%Create a fill for bonus points:
color2 = fill([x1_fn3,x1_fn3,x2_fn3,x2_fn3],[0,y1_fn3,y2_fn3,0],'b');
set(color2,'facealpha',.5);


%Instruction did not specify if the numbers had to be in any particular
%order so I took that to mean the numbering of the intersections can be in
%any random order. I included this comment because on a few of the test
%cases where fn2 and fn3 do not cross one another, the numbers 3 and 4 are
%4 and 3 when reading left to right. 

%Determining which side is higher:
    if y1_fn2 > y1_fn3
        info(i,6) = 1;
        info(i,7) = 2;
    else
        info(i,6) = 2;
        info(i,7) = 1;
    end

end



fprintf('\n\t\tArea(fn2)\tLeft Hand\tRight Hand\t Midpoint\t Area(fn3)\tLeft Hand\tRight Hand\tMidpoint\tLeft Edge\tRight Edge\n')
for n = 1:r
    if info(n,6) == 1
        gsf = 'fn2';
    else
        gsf = 'fn3';
    end
    
    if info(n,7) == 1
        hm = 'fn3';
    else
        hm = 'fn3';
    end
    fprintf('\n\t\t%0.2f\t\t%0.2f\t\t %0.2f\t\t %0.2f\t\t%0.2f\t\t%0.2f\t\t\t%0.2f\t\t%0.2f\t\t%0.2f\t\t%0.2f\n',info(n,2),info(n,9),info(n,10),info(n,11),info(n,3),info(n,12),info(n,13),info(n,14))
    %I was having an issue with left edge and right edge. It was displaying
    %110 and 102 repeatedly which I really dont understand how MATLAB got
    %those 2 values from the text in the previous condiotionals. 
    
    
    %I did the bonus so yeah...
end
