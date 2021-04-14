%% ENGI 1331 MA4
% Mubashar Khan
% Last Update: February 21, 2017

%% MA4 Problem #1

clc
clear

%Problem Statement: Create a program that will help consumers determine the
                    %efficiency of their stoves.
Name = input('Enter the brand name and model of the stove: ','s');
redo = 1; %Defines redo so that the while loop will start
k = 1; %Defines the counter.
fprintf('\n\nHousehold Appliance Efficiency Calculator: Entry #%0.0f\n\n',k)
%I put this statement twice so that I could put different line spacing.
%This print statement starts at the top of the command window whereas the
%following print statement skips 2 lines and then displays.

while redo == 1 %Checks to see that the user chose Yes when asked if they wanted to repeat
if k > 1 %I made it start at k == 2 so that if would not repeat itself with the first set of entries
    fprintf('\n\n\nHousehold Appliance Efficiency Calculator: Entry #%0.0f\n\n',k)
end
%Input Variables:
Initial_temp = input('Enter the initial room temperature of water [deg F]: ');
Time = input('Enter the time it took the water to boil [min]: ');
    %Data Validation for Time:
    while Time < 0 %Checks to see if Time is negative
        Time = input('Please enter a positive time for how long it takes the water to boil [min]: ');
    end
P = input('Enter the power of the stove top burner [watts]: ');

%Intermediate Variables:
%Convert 1 Gallon to Liters and then to m^3
V = (1 / .264 * 1000 / 100^3); %[m^3]
%D = Density of water
%M = D * V 
%Convert temp to Celsius
Initial_temp = (Initial_temp -32) / 1.8;
Final_temp = 100; % [°C]
Delta_temp = (Final_temp - Initial_temp);
C = 4186; %Specific heat of water [J/Kg*°C]
Time = Time *60; %Converts Time to Seconds [s]

%Output Variables:
%Q = Energy Required [J]
%Power_burner = Power used by burner [W]
%Efficieny = Burner Efficiency [%]

%Assumptions:
%Air Pressure will not impact any results.
%The pan on the stove does not impact results(by abosrbing heat and also because everyone has different pans at home).
D = 1000; %Density of water [Kg/m^3] I put this in assumptions because in real life, the density of water varies at different temps. 
%C = 4,186 [J/Kg*°C]


%Calculations:
M = D * V; % [Kg]
Q = M * C * Delta_temp; %[J] 
Power_Burner = Q / Time; %[W]
Efficiency = (Power_Burner / P) * 100;

%Data Validation for power and efficiency:
while Efficiency > 100 %Checks to see if the Efficiency is impossible
    warning('The burner power you entered is not possible')
    P = input('Enter the power of the stove top burner [watts]: '); %User enters a new value for Power
    Efficiency = (Power_Burner / P) * 100; %Recalculated the value for efficiency based on the new power P.
end
    
%Print Statements:
fprintf('\nEnergy Required :\t\t\t\t\t%0.0f J' ,Q)
fprintf('\nPower used by the burner:\t\t\t%0.0f W' ,Power_Burner)
fprintf('\n\nBurner Efficiency for a %s stove: %0.1f %%' ,Name,Efficiency)

redo = menu('Would you like to enter new values for the time and temperature?','Yes','No'); %Allows user to enter new values
k = k + 1; % increases count by 1
end



%% MA4 Problem #2:
%NOTE: Originally I hardcoded a portion of this problem. I have now fixed that and the code should be flexible.
%Additionally I added the code for the quarterly cost report which was not
%included in my original program. 

clear
clc

%Problem Statement: Determine the highest costing quarter (combine all 5 products) and the associated Total Material, Labor,
                    %Transportation, and overall cost as well as the highest costing product for the year and the associated 
                    %Material, Labor, Transportation, and Total cost for that product. 

%Input Variables:
Dataset1 = importdata('Problem2_cost.csv'); %Imports data from the .csv files
Dataset2 = importdata('Problem2_volume.csv'); %Imports data from the .csv files

[numR, numC] = size(Dataset1); %finds the size of dataset1
[numRo, numCo] = size(Dataset2); %finds the size of dataset2

redo = 1; %Defining the value to make the loop run
while redo == 1

%Intermediate Variables:
%Find sum of the cost and volumes which will then be used to find greatest cost.

%Highest Costing Quarter:
sum_quarter = sum(Dataset2);
l_Quarter = max(sum_quarter);
position = find(sum_quarter == l_Quarter);

%In the event that another category were added to costs, all I would need
%to do to adjust this code is copy and paste the following line and then
%change the number in Dataset1(:,n) to 4 and so on.
mat_Cost_Quar = sum(Dataset1(:,1) .* Dataset2(:,position));
lab_Cost_Quar = sum(Dataset1(:,2) .* Dataset2(:,position));
trans_Cost_Quar = sum(Dataset1(:,3) .* Dataset2(:,position));
Overall_Cost_Quar = mat_Cost_Quar + lab_Cost_Quar + trans_Cost_Quar;

%Highest Costing Product:
k = 0; %defines counter
while k ~= numR %sets condition while counter is not equal to the number of rows in dataset1
    k = k + 1;
    Cost(k) = sum(Dataset1(k,:)); %Creates a vector containing all values for the production costs
end
k=0;

n = 0; %defines counter
while n ~= numRo %sets condition while counter is not equal to the number of rows in dataset2
    n = n + 1;
    Volume(n) = sum(Dataset2(n,:)); %Creates a vector containing all values for the ammount produced
end
n=0;
%Create a transposed vector to easily multiply the values with the
%information from the datatable
VectorC = Cost' .* Volume'; %Multiplies the costs with the volume to find the most costly product and stores them in VectorC
Largest_Cost = max(VectorC); %Identifies most costly product
location = find(VectorC(:,1) == Largest_Cost); %Gives location of the largest cost

%Output Variable:
%mat_Cost = ammount of the product * the cost per product 
%lab_Cost = ammount of product * labor cost per product
%trans_Cost = ammount of product * transportation cost per product
%Overall_Cost = sum of mat_Cost, lab_Cost and trans_Cost

%Calculuations:

Product_Volume = Volume(location);

mat_Cost = Product_Volume * Dataset1(location,1);   %Calculates Material Costs by taking the given volume and mulitplying by the appropriate dataset
lab_Cost = Product_Volume * Dataset1(location,2);   %Calculates the labor cost of producing the given volume
trans_Cost = Product_Volume * Dataset1(location,3); %Calculates transportation costs off producing given volume
Overall_Cost = mat_Cost + lab_Cost + trans_Cost;    %Calculates overall costs associated with production

%Outputs: 
%Highest Costing Quarter:
    fprintf('\nQuarter %0.0f was the highest costing quarter for the year.\n\n', position)
    fprintf('Material Costs: $%0.2f\n', mat_Cost_Quar)
    fprintf('Labor Costs: $%0.2f\n', lab_Cost_Quar)
    fprintf('Transportation Costs: $%0.2f\n', trans_Cost_Quar)
    fprintf('Overall Costs: $%0.2f\n', Overall_Cost_Quar)

%Highest Costing Product:
    fprintf('\nProduct %0.0f was the highest costing product for the year.\n\n', location)
    fprintf('Material Costs: $%0.2f\n', mat_Cost)
    fprintf('Labor Costs: $%0.2f\n', lab_Cost)
    fprintf('Transportation Costs: $%0.2f\n', trans_Cost)
    fprintf('Overall Costs: $%0.2f\n', Overall_Cost)

    
    redo = menu('Would you like to enter new values for Volume?','Yes','No');
    if redo == 1
        Dataset2 = input('\nPlease enter another Volume Data set that is 5 by 4: ');
        [r, c] = size(Dataset2);
        while (r ~= numR) && (c ~= 4) %Checks to make sure the num of rows match and also check to see if there are 4 quarters
            fprintf('\nYou entered a %0.0f by %0.0f. ',r,c) 
            Dataset2 = input('Please enter a Volume Data set that is 5 by 4: ');
            [r, c] = size(Dataset2); %Changes the value of r and c to match the new matrix
        end
    end
end


%% MA4 Problem #3

clear
clc

%Problem Statement: Ask  user to enter either a color band or a resistance
                    %and use that information to find either the resistance or the color band.


%Input Variables:
%Res_or_color = The user's choice of resistance, colorband or nothing
load('P2_ColorGuide.mat') %Loads the data from the file
q = 0; %Defining the Counter
redo = 1; 
while redo == 1
Res_or_color = menu('Will you be entering a resistance or a colorband?','Resistance','Color Band'); %Allows the user to specify what they want to convert

if Res_or_color == 0
    error('Program Terminated');
end

if Res_or_color == 1 % Notifies the user of what they chose and what it will do.
    fprintf('Converting Resistance to Color Band\n\n\n');
else
    fprintf('Converting Color Band to Resistance\n\n\n');
end

if Res_or_color == 1 %Determines whether user chose resistance or colorband
    Resist = input('Enter the resistance in Ohms as a vector: ');
else
    Color = input('Enter the color band as a cell array (3 colors): ');
end

if Res_or_color == 1 %Code for Resistance to Color Band
    [row, col] = size(Resist);
    Multiplier = Resist(:,3:col); %Creates a new matrix which contains the number of 0's in the multiplier
    k = 1; %Defines counter
    while (max(Multiplier) > 0) && k < 4
        Resist = input('Enter an appropriate resistance in Ohms as a vector: ');
        [row, col] = size(Resist); %Ends the loop early if the user enters a valid resistance.
        Multiplier = Resist(:,3:col); %Redefines Multiplier to fit the size of the new matrix
        k = k + 1;
    end
    if max(Multiplier) > 0 
        warning('Assuming all values after the second position are 0.')
        Multiplier = Resist(:,3:col) .* 0; %Converts all values in Multiplier to 0
        Resist = [Resist(1),Resist(2),Multiplier]; %Creates a new matrix containing the assumed resistance
    end
    %if max(Multiplier) > 0
    %    error('Invalid Mulitplier.'); %Outputs an error message if the user enters anything other than 0's in the third through n columns
    %end

    [r, c] = size(Multiplier); %gets the size of the multiplier which will be used to choose the multiplier color

    a = Resist(1) + 1; %Because of the way the array ColorCode is set up(starts with 1 instead of 0), I had to add 1 to each of the values I called in order to get the correct output
    b = Resist(2) + 1;
    c = c + 1;
    First_Band = char(ColorCode(a)); 
    Second_Band = char(ColorCode(b));
    Multip_Band = char(ColorCode(c));
else %Code for Color Band to Resistance
    [row, col] = size(Color);
    count = 1; %Defines the counter
    while (count < 4) && (col ~= 3)
        Color = input('Enter the color band as a cell array (3 colors): ');
        count = count + 1;
    end    
    
    if col < 3
        error('Program Terminated. Appropriate color band was not entered.')
    elseif col > 3
        warning('You entered more than 3 colors. The program will use the last 3 colors specified.')
        Color = {Color{(col-2)},Color{(col-1)},Color{(col)}};
    end
    %if col ~= 3
    %    error('Invalid number of colors.');
    %end
    First_Color = find(strcmpi(ColorCode, char(Color(1)))) - 1;%Because of the way the array ColorCode is set up(starts with 1 instead of 0), I had to subtract 1 from each of the values I called in order to get the correct output
    Second_Color = find(strcmpi(ColorCode, char(Color(2)))) - 1;
    Third_Color = find(strcmpi(ColorCode, char(Color(3)))) - 1;
    Multiplier = 10 ^ Third_Color; %This raises 10 to the power of however many zeros needed for the multiplier.
    part1_Answer = First_Color;
   
    
    if part1_Answer == 0; %Ensures that in the case of a TEST such as {'black','green','orange'}, the first element '0' will not be displayed to match the provided example 
        part1_Answer = '';
    end
%<<<<<Making the first element disappear would change the value of the
%resistance and basically make the color to resitance conversion wrong,
%however I decided it was best to just match the instructions.>>>>>
end

%Output:
if Res_or_color == 1
    fprintf('\nThe correct color band is: %s %s %s ',First_Band,Second_Band,Multip_Band)
else %I added the following if condition just in case the second number is '0'
    if Second_Color ~= 0
        part2_Answer = Second_Color * Multiplier;
        fprintf('\nThe resistance for the given color band is: %0.0f%0.0f ',part1_Answer,part2_Answer)
    else
        part2_Answer = First_Color * (10^(Third_Color + 1));
        fprintf('\nThe resistance for the given color band is: %0.0f ',part2_Answer)
    end
end

redo = menu('Would you like to enter new values for Volume?','Yes','No');
q = q + 1;
    if redo == 2 %Checks to see if user said no to redo
        fprintf('\n\nThe program was run %0.0f times', q) %Outputs the number of times the program was run.
    end
end

%{
<<<<<extra lines
of comments
so this 
program is 
over 300 lines long>>>>>
%}

