%% ENGI 1331 MA1
% Mubashar Khan
% Last Update: January 28, 2017

%% MA1: Problem #1

clc
clear

%Problem Statement: Find the weight of the rod given a user defined volume.

%Input Variables: 
V = input('Please enter the volume of the rod: '); % Volume [m^3]
%gets user defined value for the volume of rod 
SG = 4.7;  % SG = Specific Gravity [Unitless]
g = 1.25;  % g  = gravity on Callisto [m/s^2]
Dw = 1000; % Dw = Density of water [kg/m^3]

%Intermediate Variables:
%Dr = Density of rod [kg/m^3]
%Density = Specific Gravity * Density of Water
%Gives Density of the rod which will be used to find mass
Dr = SG * Dw; % [kg/m^3]
%m  = mass [kg]
%Wn = Weight in Newtons [N] >>>>> This is the answer I will get through my
      %caluclations. Then I will convert it to pounds force. <<<<<

%Output Variables:
%W = Weight in pounds force [lbf]

%Calculations:
m = Dr * V;   % [kg] used to find the weight in Newtons
Wn = m * g;   % [kg*m/s^2] otherwise known as [N]
W = Wn * .225;% Converts from [N] to [lbf]

fprintf('\nThe weight of the rod on Callisto is: %0.0f pounds-force' ,W)

%% MA1: Problem #2

clc
clear

%Problem: How long will it take the motor to raise a load given the user
          %defined power, efficiency, weight and height.

%Input Variables:
Name = input('Please enter a name for your motor: ','s');
P = input('Please enter the Power of the motor [W]: '); % P = Power [W]
n = input('Please enter the Rated Efficieny of the moter between 1% and 100%: ')/100; %Re = Rated Efficiency [%] 
m = input('Please enter the mass of the load being lifted [kg]: '); %m = mass [Kg]
H = input('Please enter the height that the load is lifted [m]: '); %H = Height [m]

%Intermediate Variables:
%E = Potential Energy as the weight is lifted
%OE = Output Energy 
%

%Output Variables:
%T = Time [s]

%Assumptions: This is on Earth and the gravity is 9.8 (m/s^2).
g = 9.8; %g = acceleration of gravity [m/s^2]

%Calculations:
E = m * g * H; % E = Energy [J]
OE = (E / n); %Output Energy [J]
T = OE / P; % J/(J/s) = [s]

fprintf('\n\nFor %s motor, it will take %0.2f seconds to raise a mass of %0.0f [kg] to a height of %0.1f [m].',Name,T,m,H) 

%% MA1 Problem #3

clc
clear

%Problem Statement: Create a program that will help consumers determine the
                    %efficiency of their stoves.
fprintf('Household Appliance Efficiency Calculator: Stove\n\n')
%Input Variables:
Initial_temp = input('Enter the initial room temperature of water [deg F]: ');
Time = input('Enter the time it took the water to boil [min]: ');
Name = input('Enter the brand name and model of the stove: ','s');
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

%Print Statements:
fprintf('\nEnergy Required :\t\t\t\t\t%0.0f J' ,Q)
fprintf('\nPower used by the burner:\t\t\t%0.0f W' ,Power_Burner)
fprintf('\n\nBurner Efficiency for a %s stove: %0.1f %%' ,Name,Efficiency)

%<<<<< NOTE: I solved this by hand which got me very similar but slightly
%different answers than the provided test cases. I attributed this to
%rounding differences between MATLAB and my own work, however I am not
%completely certain where the issue came into existence.>>>>>

%% MA1 Problem #4

clc
clear

%Problem Statement: compare the pressure between the ideal gas 
                    %law and the van der Waals equation based on user
                    %defined information.

%Input Variables:
Name = input('Enter the name of the gas: ','s');
Volume = input('Enter the volume of the gas [L]: ');
Temp = input('Enter the absolute temperature of the gas [K]: ');
a = input('Enter the value of a [-]: ');
b = input('Enter the value of b [-]: ');
r = .08206;
%Intermediate Variables:
%None

%Output Variables:
%IGL = Ideal Gas Law [atm]
%vdW = van der Waals [atm]
%diff = difference between IDL and vdW [atm]

%Assumptions:
%For each element, we are using 1 mole of that element meaning n = 1 for
%all test cases

%Calculations:
IGL = 1 * r * Temp / Volume; %[atm]
vdW = (1*r*Temp/(Volume - 1*b))-((a*1^2)/Volume^2); %[atm]
diff = abs(IGL-vdW); %[atm]

fprintf('\n\nThe estimated pressure using the Ideal Gas Law is: %0.4f atm.' ,IGL)
fprintf('\nThe estimated pressure using the van der Waals is: %0.4f atm.' ,vdW)
fprintf('\nThe difference between these two estimates is: %0.4f atm.' ,diff)


