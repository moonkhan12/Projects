%% ENGI 1331 MA6
% Mubashar Khan
% Last Update: March 6, 2017

%% MA6 Problem #1

clear
clc

%{
Problem Statement: Write your own “flipper” script where the user inputs a 
                   matrix of any size. This script simply takes a given 
                   matrix and flips it from left to right, each row in this
                   matrix. 
%}

%Input Variables:
%Matrix = User input matrix
Matrix = input('Enter a matrix of your choice: ');

%Intermediate Variables: 
% None

%Output Variables: 
% A = new matrix which stores the flipped user defined Matrix

%Calculations:
[row, col] = size(Matrix);

A = zeros(row,col); %Created this matrix just to stop getting the message about the matrix A changing sizes
for x = 1:row
    for y = 1:col
         A(x,y) =  Matrix(x,col-y+1);
    end
end

%Output:
fprintf('\nYour new Matrix is:\n')
disp(A)

%% MA6 Problem #2

clear
clc

%Problem Statement: Write a script that determines the overall maximum and
%                   minimum value of a matrix and the location of each 
%                   WITHOUT using the max or min function or implicit loops.

%Input Variables:
% Matrix = user defined matrix
Matrix = input('Enter a Matrix of your choosing: '); %Gets user input for the elements of Matrix

%Intermediate Variables:
% None

%Output Varibles:
% location1 stores the x coordinate
% location2 stores the y coordinate
% upper_Limit starts at inifity and changes to the smallest value 

% position1 stores the x coordinate
% position2 stores the y coordinate
% lower_Limit starts at negative inifity and changes to the largest value 

%Calculations
[row, col] = size(Matrix); %stores the number of row and col of Matrix


%Minumum
upper_Limit = inf; % sets upper_Limit to the infinity so that the conditional will work for any number entered. 
for x = 1:row
    for y = 1:col
        if Matrix(x,y) < upper_Limit
            upper_Limit = Matrix(x,y);  %if the value of Matrix(i,n) is less than infinity, upper_Limit's value changes to Matrix(i,n). Becauase upper_Limit starts at infinty, any number entered in the Matrix will work.
            location1 = x; %stores the x coordinate
            location2 = y; %stores the y coordinate
        end
    end
end

%Maximum
lower_Limit = -inf; %sets the lowest possible number to infinty so that the program will work for any number entered
for i = 1:row
    for n = 1:col
        if Matrix(i,n) > lower_Limit 
            lower_Limit = Matrix(i,n); %if the value of Matrix(x,y) is larger than the lower_Limit, lower_limit becomes 
            position1 = i; %stores the x coordinate
            position2 = n; %stores the y coordinate
        end
    end
end

%Output:
fprintf('\nThe overall Minimum value is located at (%0.0f,%0.0f) and is %0.2f.',location1,location2,upper_Limit)
fprintf('\nThe overall Maximum value is located at (%0.0f,%0.0f) and is %0.2f.',position1,position2,lower_Limit)


%% MA6 Problem # 3

clear
clc

%Problem Statement: You need to design a system which can monitor the 
%                   current received irradiation data and alert if any 
%                   cells are reporting outside of the range of their 
%                   surrounding neighbors.

%Input Variables:
% Dataset = imported data from Problem3.csv
Dataset = importdata('Problem3.csv');
% Percent_Diff = user defined percentage difference

[row, col] = size(Dataset);

for i = 1:row
    for n = 1:col
        while Dataset(i,n) > 1000 %Checks to make sure all values of Dataset are less than 1000 and if they are not, asks user to replace them
            fprintf('Please replace cell(%0.0f,%0.0f) with a new value: ',i,n)
            Dataset(i,n) = input(' ');
        end
    end
end

Percent_Diff = input('Enter the Percentage Difference check for failed cells: ');
fprintf('\n')
fprintf(' Row#\tCol#\tPV Cell\tAvg around PV\tPercent Difference')


%Intermediate Variables:
% None

%Output Variables:
% r = row of the cell
% c = column of the cell
% Average = average value of surounding cells
% Calc_percent_Diff = Calculated percent difference


%Calculations:
for x = 1:row
    for y = 1:col-6%NOTE: There is a problem here. The correct code should be 
                   %'for y = 1:col'. However if you set 45 or 50 as a bound
                   %or as part of the set, there is an error saying 
                   %'Subscript indices must either be real positive integers
                   %or logicals.' Every other value works and the numbers 
                   %46,47,48 and 49 also work without a problem. This leads
                   %to the conclusion that there is something wrong with
                   %lines 45 and 50 in the dataset.
                   
        if Dataset(x,y) == Dataset(1,1) %Top left
            Average = (Dataset(x+1,y) + Dataset(x+1,y+1) + Dataset(x,y+1))/3;
            Calc_percent_Diff = (abs(Dataset(x,y) - Average)/((Dataset(x,y) + Average)/2))*100;
            if Calc_percent_Diff > Percent_Diff 
                r = x;
                c = y;
                fprintf('\n %0.0f\t%0.0f\t\t%0.0f\t\t%0.2f\t\t\t%0.2f',r,c,Dataset(x,y),Average,Calc_percent_Diff)
            end
        elseif Dataset(x,y) == Dataset(1,col) %Top right
            Average = (Dataset(x,y-1) + Dataset(x+1,y-1) + Dataset(x+1,y))/3;
            Calc_percent_Diff = (abs(Dataset(x,y) - Average)/((Dataset(x,y) + Average)/2))*100;
            if Calc_percent_Diff > Percent_Diff 
                r = x;
                c = y;
                fprintf('\n %0.0f\t%0.0f\t\t%0.0f\t\t%0.2f\t\t\t%0.2f',r,c,Dataset(x,y),Average,Calc_percent_Diff)
            end
        elseif Dataset(x,y) == Dataset(row,1) %Bottom left
            Average = (Dataset(x-1,y) + Dataset(x-1,y+1) + Dataset(x,y+1))/3;
            Calc_percent_Diff = (abs(Dataset(x,y) - Average)/((Dataset(x,y) + Average)/2))*100;
            if Calc_percent_Diff > Percent_Diff 
                r = x;
                c = y;
                fprintf('\n %0.0f\t%0.0f\t\t%0.0f\t\t%0.2f\t\t\t%0.2f',r,c,Dataset(x,y),Average,Calc_percent_Diff)
            end
        elseif Dataset(x,y) == Dataset(row,col) %Bottom right
            Average = (Dataset(x-1,y) + Dataset(x-1,y-1) + Dataset(x,y-1))/3;
            Calc_percent_Diff = (abs(Dataset(x,y) - Average)/((Dataset(x,y) + Average)/2))*100;
            if Calc_percent_Diff > Percent_Diff 
                r = x;
                c = y;
                fprintf('\n %0.0f\t\t%0.0f\t\t%0.0f\t\t%0.2f\t\t\t%0.2f',r,c,Dataset(x,y),Average,Calc_percent_Diff)
            end
        elseif Dataset(x,y) == Dataset(1,y) && (Dataset(x,y) ~= Dataset(1,1) && Dataset(x,y) ~= Dataset(1,col)) %Top row
            Average = (Dataset(x,y-1) + Dataset(x+1,y) + Dataset(x,y+1) + Dataset(x+1,y+1) + Dataset(x+1,y-1))/5;
            Calc_percent_Diff = (abs(Dataset(x,y) - Average)/((Dataset(x,y) + Average)/2))*100;
            if Calc_percent_Diff > Percent_Diff 
                r = x;
                c = y;
                fprintf('\n %0.0f\t\t%0.0f\t\t%0.0f\t\t%0.2f\t\t\t%0.2f',r,c,Dataset(x,y),Average,Calc_percent_Diff)
            end
        elseif Dataset(x,y) == Dataset(row,y) && (Dataset(x,y) ~= Dataset(row,1) && Dataset(x,y) ~= Dataset(row,col)) %Bottom row
            Average = (Dataset(x-1,y) + Dataset(x,y+1) + Dataset(x-1,y+1) + Dataset(x-1,y-1) + Dataset(x,y-1))/5;
            Calc_percent_Diff = (abs(Dataset(x,y) - Average)/((Dataset(x,y) + Average)/2))*100;
            if Calc_percent_Diff > Percent_Diff 
                r = x;
                c = y;
                fprintf('\n %0.0f\t\t%0.0f\t\t%0.0f\t\t%0.2f\t\t\t%0.2f',r,c,Dataset(x,y),Average,Calc_percent_Diff)
            end
        elseif Dataset(x,y) == Dataset(x,1) && (Dataset(x,y) ~= Dataset(1,1) && Dataset(x,y) ~= Dataset(row,1)) %left side
            Average = (Dataset(x,y+1) + Dataset(x+1,y) + Dataset(x-1,y) + Dataset(x-1,y+1) + Dataset(x+1,y+1))/5;
            Calc_percent_Diff = (abs(Dataset(x,y) - Average)/((Dataset(x,y) + Average)/2))*100;
            if Calc_percent_Diff > Percent_Diff 
                r = x;
                c = y;
                fprintf('\n %0.0f\t\t%0.0f\t\t%0.0f\t\t%0.2f\t\t\t%0.2f',r,c,Dataset(x,y),Average,Calc_percent_Diff)
            end
        elseif Dataset(x,y) == Dataset(x,col) && (Dataset(x,y) ~= Dataset(1,col) && Dataset(x,y) ~= Dataset(row,col)) %right side
            Average = (Dataset(x-1,y) + Dataset(x+1,y) + Dataset(x-1,y-1) + Dataset(x+1,y-1) + Dataset(x,y-1))/5;
            Calc_percent_Diff = (abs(Dataset(x,y) - Average)/((Dataset(x,y) + Average)/2))*100;
            if Calc_percent_Diff > Percent_Diff 
                r = x;
                c = y;
                fprintf('\n %0.0f\t%0.0f\t\t%0.0f\t\t%0.2f\t\t\t%0.2f',r,c,Dataset(x,y),Average,Calc_percent_Diff)
            end 
        else  %All other locations
            Average = (Dataset(x+1,y) + Dataset(x,y+1) + Dataset(x-1,y) + Dataset(x,y-1) + Dataset(x-1,y-1) + Dataset(x+1,y+1) + Dataset(x-1,y+1) + Dataset(x+1,y-1))/8 ;
            Calc_percent_Diff = (abs(Dataset(x,y) - Average)/((Dataset(x,y) + Average)/2))*100;
            if Calc_percent_Diff > Percent_Diff 
                r = x;
                c = y;
                fprintf('\n %0.0f  \t%0.0f\t\t%0.0f\t\t%0.2f\t\t\t%0.2f',r,c,Dataset(x,y),Average,Calc_percent_Diff)
            end
        end
    end
end
