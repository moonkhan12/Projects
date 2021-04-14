%% ENGI 1331 MA5
% Mubashar Khan
% Last Update: February 27, 2017

%% MA5 Problem #1

clear
clc

%{
Problem Statement: The program should prompt the user to enter a vector 
                   of resistances in ohms then prompt the user to select the type of 
                   connection (series or parallel). Then calculate the equivalent resistance.
                   The program should then ask the user if they would like to enter another 
                   set of resistors. If the user selects yes, repeat the program. Otherwise,
                   your program should end.
%}

%Input Variables:
% Resist = user defined vector of resistance values
% Type = user defined (Series Circuit or Parallel Circuit)
% Redo = user chooses whether to repeat (Yes or No)

%Intermediate Variable:
Redo = 1; %Defines Redo to make the program start

%Assumptions: 
%The user did not enter a negative Resistance

%Output Variables:
%Equiv_Resistance = Equivalenet Resistance of circuit

%Output:
while Redo == 1
    Resist = input('Enter the resistance values in a Vector []: ');
    Type = menu('What type of Circuit is this?','Series Circuit','Parallel Circuit');

    if length(Resist) == 1
        fprintf('\nThe resistance entered is: %0.0f',Resist)
    else
        %Primary print statement:
        %The if statement is only here in the event that the user has only
        %one resistance value.
        fprintf('\nThe resistances entered are: ')
        for n =1:(length(Resist)- 1)
            fprintf('%0.0f, ',Resist(n))
        end
        fprintf('and %0.0f ohms. ',Resist(length(Resist)))
        %{
            The reason I created my output using the print statement
            followed by a for loop and then another print statement was
            that this allowed me to match the formatting as specified by
            the example exactly. The first fprintf statement prints 'The 
            resistances entered are: '. The fprintf in the for loop prints 
            each number up until the second to last number with a ',' and 
            a space. The final fprintf statement prints 'and' the number 
            and 'ohms'. Together this forms the statement which matches the
            directions exactly.
        %}
    end
    
    %Tells the program what to do based on what the user chose for which type of circuit this is
    if Type == 1 %Series Circuit
        Equiv_Resistance = sum(Resist);
    else %Parallel Circuit
        for k = 1:length(Resist) %sets the bounds of the for loop
        Equiv_Resistance(k) = 1/Resist(k); %Creates a new matrix with 1/Resistance of each element
        end
        Equiv_Resistance = 1/sum(Equiv_Resistance);
    end
    fprintf('\nThe equivalant resistance is %0.0f ohms.',Equiv_Resistance)
    Redo = menu('Would you like to enter new values for the resistance?','Yes','No'); %Allows the user to choose to enter new values or end the program
end


%% MA5 Problem #2

clear
clc

%{
Problem Statement: The program should generate a string representation of
                   the vector of data, as well as provide basic statistics 
                   including the number of negative values, number of 
                   positive values, the sum of all of the values, the mean,
                   median, and standard deviation of the data set, and the 
                   minimum and maximum values in the data set.
%}

%{
Input Variables:
Amount = number of data points
decimals = number of decimal places
Entry = user defined values for the data points
%}
Amount = input('Enter the number of data points: ');
decimals = input('Enter the number of decimal places you want shown: ');
for k = 1:Amount
    fprintf('Data point #%0.0f:', k)
    Entry(k) = input(' '); %#ok<*SAGROW>
end

%Intermediate Variables:
%None

%{
Output Variables:
pos = number of positive values entered
neg = number of negative values entered
sumofAll = finds sum of all the values
average = computes average
Deviation = calculates standard deviation
minimum = stores min value
maximum = stores max value
%}


%<<<<<NOTE: I used %g in my fprintf statements instead of %f because all my
%outputs had trailing zeros. If you choose to use a rounding value over 5 
%decimal places, then please know that all you would need to do is replace 
%all %g with %f(use ctrl F and replace %g) and you can use a larger 
%rounding value. However I expect you will probably use 1, 2, 3 or 4 as 
%rounding values so it probably won't matter.>>>>>

%Calculations:
fprintf('\nData Set Information:')
if length(Entry) == 1
    fprintf('\nVector = [%g]',Entry)
else    
    fprintf('\nVector = [')%matches instructions exactly. 
    for n = 1:(length(Entry)-1)
        fprintf('%g, ',Entry(n))
    end
    fprintf('%g]',Entry(length(Entry)))
end    
% Instructions said: The vector of data does not need to be displayed with
% the number of decimal places specified by the user. So I didn't round 
% those values.


pos = sum(Entry > 0);
neg = sum(Entry < 0);
sumofAll = round(sum(Entry),decimals);
average = round(mean(Entry),decimals);
medians = median(Entry);
Deviation = round(std(Entry),decimals);
minimum = round(min(Entry),decimals);
maximum = round(max(Entry),decimals);

%Output:
fprintf('\n\n# Positive: \t\t\t%0.2f', pos)% I hard coded the number of decimal places for pos and neg because these values will always be whole numbers so it really doesnt matter if they round like the other values. 
fprintf('\n# Negative: \t\t\t%0.2f', neg) %If I wanted to round them like the others, I could; there just isnt any reason to.
fprintf('\n\nSum of all values: \t\t%g', sumofAll)
fprintf('\n\nMean: \t\t\t\t\t%g', average)
fprintf('\nMedian: \t\t\t\t%g', medians)
fprintf('\n\nStandard Deviation: \t%g', Deviation)
fprintf('\n\nMinimum: \t\t\t\t%g', minimum)
fprintf('\nMaximum: \t\t\t\t%g', maximum)

%NOTE: I while I managed to round each number to the user specified decimal
%places, the program put trailing 0's on each value and I don't know how to
%fix this problem. I tried using format shortG but that didn't do anything.


%% MA5 Problem #3

clear
clc

%{
Problem Statement: The goal of the program is to ask the user to enter an 
                   initial inventory and a vector of sales (various lengths).
                   Then compute the number of carts in inventory for each 
                   of the weeks in the vector provided or until the 
                   inventory drops below zero.  You should produce the 
                   table (for each week) up to the before inventory goes 
                   below zero.
%}

%{
Input Variables:
I = initial inventory
Sales = user defined vector of sales
Redo = user chooses whether to repeat (Yes or No)
%}

redo = 1; %Defines redo to start the program
while redo == 1
    
Inventory = input('\n\nInitial inventory on week 1: ');
while Inventory <= 0 %DATA VALIDATION: Asks the user to continue to enter values for Inventory until the user enters a positive number.
    warning('Starting Inventory can not be less than or equal to zero')
    Inventory = input('Initial inventory on week 1: ');
end
Sales = input('Enter the sales of each week as a vector []: ');
while min(Sales) < 0 %DATA VALIDATION: Asks the user to continue to enter values for Sales until the user enters all positive number.
    warning('You entered a negative value for sales')
    Sales = input('Enter the sales of each week as a vector []: ');
end
P = Sales;

%Intermediate Variables:
numWeeks = length(Sales); %Acts as a counter for the number of weeks

%Output Variables: 
% Week = number of weeks
% Sales = amount entered for sales
% Inventory = new inventory based on number of sales

%Calculations and Output:
fprintf('Week:\t\t\t')
for weeks = 1:numWeeks;
    fprintf('%0.0f\t\t',weeks)
end

fprintf('\nSales:\t\t\t')
for count = 1:length(Sales);
    fprintf('%0.0f\t\t',Sales(count))
end

for k = 1:length(Sales)
    if k == 1 %fixed a problem where the program was trying to get a value of P(0)
        P(k) = Sales(k);
    else 
        P(k) = Sales(k-1);
    end
    Inventory(k+1) = P(k) + Inventory(k) - Sales(k); %Equation as specified by instructions
end

fprintf('\nInventory:\t\t')
for n = 1:(length(Inventory)-1);
    fprintf('%0.0f\t\t',Inventory(n))
end
% Used a fprintf statement and a for loop to correctly print out the values
% as specified by the instructions.

%EXTRA CREDIT GRAPH: 
x = [1,(1:weeks)]; %Sets x coordinate vector
y = [1,Inventory((1:length(Inventory)-1))]; %Sets y coordinate vector

figure %Creates a graph for the data 
plot(x,y,'p');
    title('Inventory Levels')
    xlabel('Time [Week]')
    ylabel('Inventory Level [Units]')
%A small error occurs on some of the graphs where an extra data point
%appears. I'm not sure what causes this. When this little problem occurs
%it usually just adds a second datapoint at the first week with a value of
%around 1
redo = menu('Would you like to enter another data set?','Yes','No');
end


