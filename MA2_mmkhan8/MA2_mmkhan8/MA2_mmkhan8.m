%% ENGI 1331 Lecture Notes
% Mubashar Khan
% Last Update: February 2, 2017

%% MA2 Problem #1:

clear
clc

%Problem Statement: Calculate the potential energy [J] and power [W] for each data set


%Input Variables:
%Get data for Matrices:
Dataset1 = importdata('Problem1_data1.csv');
Dataset2 = importdata('Problem1_data2.csv');


%Intermediate Variables:
g = 9.8; %Gravity [m/s^2]

%Convert data values from given values to base SI units
a = Dataset1(1,:) / 1000;         %Converts [g] to [kg]
b = Dataset1(2,:) / 3.28;         %Converts [ft] to [m]
c = Dataset1(3,:) * 60;           %Converts [min] to [s]

re_Dataset1 = [a;b;c]; %Recreates the matrix Dataset1 with proper SI units

d = Dataset2(1,:) / 2.205;        %Converts [lbm] to [kg]
e = Dataset2(2,:) / 100;          %Converts [cm] to [m]
f = Dataset2(3,:) * 60 * 60;      %Converts [hrs] to [s]

re_Dataset2 = [d;e;f]; %Recreates the matric Dataset2 with proper SI units

combined_Matrix = [re_Dataset1 re_Dataset2]; %Creates one matrix with both datasets


%Output Variable:
%Mass [g]
%Average Mass [g]
%PE = Potential Energy = mass * gravity * height  [J] 
%P = Power = Potential Energy / Time [W]


%Calculuations:
%Find number of observations
[row, col] = size(combined_Matrix); %stores the amount of rows and columns in combined_Matrix 

%Find smallest mass
Mass = combined_Matrix(1,:); %Isolates row 1 of combined_Matrix to make it easier to find the smallest mass
least_Mass = min(Mass); %Finds smallest mass
least_Mass_g = least_Mass * 1000; %Converts from [kg] to [g]
%Potential energy of the smallest mass :
location = find(combined_Matrix(1,:) == least_Mass); %Finds which column the smallest mass is in
height = combined_Matrix(2,location); %Finds the height value in the column where the mass is
PE_smallMass = least_Mass * g .* height;
%Power of the smallest mass
P_smallMass = PE_smallMass / combined_Matrix(3,location); %Takes the energy found on line 56 and divides by the average time using location as the column value 
                                                          %so that regarless of where the smallest mass is, it will get the proper time. 


%Create 1xN Matrix to store mass, height and time
M = combined_Matrix(1,:); %Groups all masses as a 1xN Matrix
H = combined_Matrix(2,:); %Groups all heights as a 1xN Matrix
T = combined_Matrix(3,:); %Groups all times as a 1xN Matrix

%Create Problem1_Results.csv matrix and file
mass_g = combined_Matrix(1,:) .* 1000;
PE = M .* g .* H;
P = PE ./ T;
Problem1_Results = [mass_g;PE;P]'; %Matrix as required by instructions
csvwrite('Problem1_Results.csv', c);

%Find Average Mass:
avg_Mass = sum(mass_g) / col; %Adds up all the masses and divides by the number of columns
avg_Mass_g = avg_Mass; %Converts from [kg] to [g]

%Find Average Potential Energy
avg_PE = sum(PE) / col; %Adds up PE of each column and divides by the number of columns
%<<<<< This could also have been done by finding avg mass and avg height
%then calculating the energy>>>>>

%Find Average Power
avg_P = sum(P) / col;


fprintf('The total number of combined observations record is %0.0f. \n\n', col)
fprintf('The minimum mass recorded was %0.1f [g].\n', least_Mass_g)
fprintf('It has a potential energy of %0.3f [J] and a power of %0.3f [W].\n\n',PE_smallMass,P_smallMass)
fprintf('The average mass [g] record is: %0.1f\n', avg_Mass_g)
fprintf('The average potential energy [J] calculated is: %0.1f \n', avg_PE)
fprintf('The average power [W] record is: %0.1f \n', avg_P)




%% MA2 Problem #2: 

clear
clc

%Problem Statement: Determine the highest costing quarter (combine all 5 products) and the associated Total Material, Labor,
                    %Transportation, and overall cost as well as the highest costing product for the year and the associated 
                    %Material, Labor, Transportation, and Total cost for that product. 


%Input Variables:
Dataset1 = importdata('Problem2_cost.csv');
Dataset2 = importdata('Problem2_volume.csv');


%Intermediate Variables:
%Find sum of the cost and volumes which will then be used to find greatest cost.
Product_1C = sum(Dataset1(1,:));
Product_2C = sum(Dataset1(2,:));
Product_3C = sum(Dataset1(3,:));
Product_4C = sum(Dataset1(4,:));
Product_5C = sum(Dataset1(5,:));

VectorA = [Product_1C;Product_2C;Product_3C;Product_4C;Product_5C];

Product_1V = sum(Dataset2(1,:));
Product_2V = sum(Dataset2(2,:));
Product_3V = sum(Dataset2(3,:));
Product_4V = sum(Dataset2(4,:));
Product_5V = sum(Dataset2(5,:));

VectorB = [Product_1V;Product_2V;Product_3V;Product_4V;Product_5V];

VectorC = VectorA .* VectorB; %Multiplies the costs with the volume to find the most costly product
Largest_Cost = max(VectorC); %Identifies most costly product
location = find(VectorC(:,1) == Largest_Cost); %Gives location of the largest cost

%Output Variable:
%mat_Cost 
%lab_Cost
%trans_Cost
%Overall_Cost


%Calculuations:

if location == 1
    Product_Volume = Product_1V; % Will replace Product_Volume with the value from Product_1V
elseif location == 2
    Product_Volume = Product_2V; % Will replace Product_Volume with the value from Product_2V
elseif location == 3
    Product_Volume = Product_3V; % Will replace Product_Volume with the value from Product_3V
elseif location == 4
    Product_Volume = Product_4V; % Will replace Product_Volume with the value from Product_4V
elseif location == 5
    Product_Volume = Product_5V; % Will replace Product_Volume with the value from Product_5V
end
%<<<<< I know that we haven't covered Conditionals in class yet, but this
%was the easiest and most efficient way I could think of to get the
%solutions to this problem while being viable for any other matrix you test with. >>>>>

mat_Cost = Product_Volume * Dataset1(location,1);   %Calculates Material Costs by taking the given volume and mulitplying by the appropriate dataset
lab_Cost = Product_Volume * Dataset1(location,2);
trans_Cost = Product_Volume * Dataset1(location,3);
Overall_Cost = mat_Cost + lab_Cost + trans_Cost;


%fprintf('Overall Costs: $%0.2f\n\n', )
fprintf('Product %0.0f was the highest costing product for the year.\n\n', location)
fprintf('Material Costs: $%0.2f\n', mat_Cost)
fprintf('Labor Costs: $%0.2f\n', lab_Cost)
fprintf('Transportation Costs: $%0.2f\n', trans_Cost)
fprintf('Overall Costs: $%0.2f\n', Overall_Cost)



%% MA2 Problem #3:

clear
clc

%Input Variables:
load('Problem3.mat')

%Calculations: 

%Part A:
%Problem Statement: Output a row vector with the first element as a number of years followed
                    %by the sum of the following N number of parts made
[row, col] = size(Prod); %counts the number of rows and columns
Prod_A = Prod(:,2:col);
new_Prod = Prod(:,2:col);%assigns new_Prod all values from the second column onwards
for a = length(Prod) %Using a for loop, this matrix can work for a matrix of any size as required by the instructions
  VectorA = [row sum(Prod_A())]; %Creates the new Matrix VectorA which is a row vector with 6 values in it.
end

%Part B:
%Problem Statement: Output a row vector with the first element as the number of years followed
                    %by the average of the following N number of parts made
Prod_B = sum(new_Prod()) / row;
VectorB = [row Prod_B];

%Part C:
%Problem Statement: Create a column vector that contains the total number of all units produced during each year. 
VectorC = [sum(new_Prod(1:row,:),2)];

%Part D:
%Problem Statement: Create a column vector that contains the max number of any type of device produced during each year
                    %in column 1, and another column vector that contains the associated Device ID in column 2.
%maximum_VectorD = max(new_Prod,[],2); %Gets maximum value in each column from new_Prod
%DeviceID = DeviceID.'; %Transpose the rows and columns
%VectorD = [maximum_VectorD, char(DeviceID)]; %Creates a 5x2 Matrix with squares where the numbers should be

%Part E:
%Problem Statement: Determine the overall maximum number of parts made and tell which year and
                    %product it is
[Value,column] = max(max(new_Prod)); %Finds the single largest value in the matrix
[ro, co] = find(Prod == Value); %Gives the x and y coordinate of the largest value in matrix Prod
Name = char(DeviceID(column)); %Determines the DeviceID of the most produced part
year_MaxProduc = Prod(ro); %Calls the year the most produced part was produced

%Part F:
%Problem Statement: Determine the number of years and number of devices
row; %Gives the number of years
[x,y] = size(new_Prod);
y; %number of devices

%Part G:
%Problem Statement: Assume your company makes a profit at a user-defined rate on each device produced, regardless of type,
                    %determine the total profit made during all listed years. Your result should be in dollars. 

Price = input('Please enter how much profit is made per device produced in cents: ') / 100; %Dividing by 100 makes the prive in dollars
Profit = sum(VectorC) * Price;
%fprintf('The profit made from selling all parts in the past %0.0f years is $%0.2f. ',row,Profit); %Take off the % if you would like to test

%Part H:
%Problem Statement: Create a matrix to look like the unshaded region of the provided test case
aF_Matrix = [new_Prod VectorC]; %combines 
Final_Matrix = [aF_Matrix; sum(aF_Matrix())]; %Places aF_Matrix on top of the sum of each column of aF_Matrix
csvwrite('Problem3_sums.csv', a);


%Get range of years
year_Initial = min(Prod(:,1));
year_Final = max(Prod(:,1));


fprintf('\nThere were %0.0f devices produced for the given data from %0.0f to %0.0f.\n\n',y,year_Initial,year_Final)
fprintf('The overall maximum production occured in %0.0f with the %s device.\nThe total production was %0.0f.',year_MaxProduc,Name,Value)

