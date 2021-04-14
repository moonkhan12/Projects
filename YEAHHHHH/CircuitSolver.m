function [I1,I2,I3,V2Max1,V2Min1,range_V2Min,range_V2Max] = CircuitSolver(V1,V2,R1,R2,R3)
%{
//////////////////////////////////////////////////////////////////////////////////////
For Reference:

            --------> I1            <-------- I2

       ______><><><><><______________><><><><><_______
       |     R1               |      R2              |
       |                      |                      |
       |                      |                      |
    ___|___ V1            ||  > R3                ___|___ V2
     _____                ||  <                    _____  
       |                  ||  <                      |
       |                  \/  >                      |
       |                  I3  |                      |
       |                      |                      | 
       |______________________|______________________|

//////////////////////////////////////////////////////////////////////////////////////
Equations:
Ohm's Law: V = I*R 
Kirchoff's Law: I1 + I2 - I3 = 0
I1 = (V1-(V2*R3)/(R2+R3))/((R1+R3)-(R3.^2)/(R2+R3))
I2 = (V2-(I1*R3)) / (R2+R3)
I3 = I1 + I2

%}
%Input values for voltage and resistance for this circuit must be positive
%Calculations were not meant to deal with negative numbers
if V1 < 0 || V2 < 0 || R1 < 0 || R2 < 0 || R3 < 0 %If any value provided in a test case is negative, the program will convert it to positive
    warning('off','backtrace') %Prevents the command window from outputting the line numbers
    %Notify the user that 1 or more of the values in the test case file
    %were negative and then make these values positive.
    %error('Program Terminated: One or more of the input values was negative')
    warning('One ore more of the input values was negative, converting all values to positive values');
end
V1 = abs(V1); %Converts value to a positive number
V2 = abs(V2); %Converts value to a positive number
R1 = abs(R1); %Converts value to a positive number
R2 = abs(R2); %Converts value to a positive number
R3 = abs(R3); %Converts value to a positive number
%This insures that all values entered for any test case are positive
%numbers.


%Task 1:
%Using Kirchoff's rules, the circuit was worked out on paper and the
%following equations were the end result of the derivations
I1 = (V1-(V2.*R3)/(R2+R3))/((R1+R3)-(R3.^2)/(R2+R3)); %[A]
I2 = (V2-(I1.*R3)) / (R2+R3); %[A]
I3 = I1 + I2; %[A]


%Task 2:
%Find Max of V2:
%Redefine Variables: (So that previous variables used for task 1 are not overwritten)
I1T2 = I1; % I1 for Task 2
I2T2 = I2; % I2 for Task 2
I3T2 = I3; % I3 for Task 2
V1T2 = V1; % V1 for Task 2
V2T2 = V2; % V2 for Task 2
R1T2 = R1; % R1 for Task 2
R2T2 = R2; % R2 for Task 2
R3T2 = R3; % R3 for Task 2
while (I3T2 > I2T2) && (I1T2 < 1) && (I1T2 > 0) && (I2T2 < 1) ... %These conditions prevent any negative current values from being used
      && (I2T2 > 0) && (I3T2 < 1) && (I3T2 > 0)
    V2T2 = V2T2 + 0.001;  %Starting at the value of V2, adds .001 until the conditions for the current values are not met
    I1T2 = (V1T2-(V2T2*R3T2)/(R2T2+R3T2))/((R1T2+R3T2)-(R3T2.^2)/(R2T2+R3T2)); %[A]
    I2T2 = (V2T2-(I1T2*R3T2)) / (R2T2+R3T2); %[A]
    I3T2 = I1T2 + I2T2; %[A]
end
V2Max1 = V2T2 - 0.001; %Stores the max voltage that can be input for V2

%Find min of V2
%Reset redfined Variables:
I1T2 = I1; % I1 for Task 2
I2T2 = I2; % I2 for Task 2
I3T2 = I3; % I3 for Task 2
V1T2 = V1; % V1 for Task 2
V2T2 = V2; % V2 for Task 2
R1T2 = R1; % R1 for Task 2
R2T2 = R2; % R2 for Task 2
R3T2 = R3; % R3 for Task 2
while (I3T2 > I2T2) && (I1T2 < 1) && (I1T2 > 0) && (I2T2 < 1) ... %These conditions prevent any negative current values from being used
      && (I2T2 > 0) && (I3T2 < 1) && (I3T2 > 0)
    V2T2 = V2T2 - 0.001;
    %Recalculate the Currents in order to check if the new current with
    %V2T2 is valid
    I1T2 = (V1T2-(V2T2*R3T2)/(R2T2+R3T2))/((R1T2+R3T2)-(R3T2.^2)/(R2T2+R3T2)); %[A]
    I2T2 = (V2T2-(I1T2*R3T2)) / (R2T2+R3T2); %[A]
    I3T2 = I1T2 + I2T2; %[A]
end
V2Min1 = V2T2 + 0.001; %The + 0.001 is needed because the loop will run 1 time more than the correct value for V2Min


%Task 3:
%
range_V2Min = zeros(1,100); %Creates a vector of 0's
range_V2Max = zeros(1,100); %Creates a vector of 0's

for R = 15:115
%Get the range of the maximum values    
    %Redefine Variables: (So that previous variables used for task 2 are not overwritten)
    I1T3 = I1; % I1 for Task 3
    I2T3 = I2; % I2 for Task 3
    I3T3 = I3; % I3 for Task 3
    V1T3 = V1; % V1 for Task 3
    V2T3 = V2; % V2 for Task 3
    R1T3 = R1; % R1 for Task 3
    R2T3 = R2; % R2 for Task 3
    R3T3 = R;  % R3 for Task 3 - This is equal to R because the instructions specify that this value will be changing from 15 to 115
    %The current value for I2T3 needs to be less than the current value of
    %I3T3 be because I3T3 is the sum of both I2T3 and I1T3
    while (I3T3 > I2T3) && (I1T3 < 1) && (I1T3 > 0) && (I2T3 < 1) ... %Checks to make sure the Current calculated is within the proper bounds.
          && (I2T3 > 0) && (I3T3 < 1) && (I3T3 > 0)
        V2T3 = V2T3 + 0.001; %Increases the value of V2 by .001 until the condition is not met. This will give the value that is .001 more than the correct Voltage
        %Recalculate the Currents in order to check if the new current with
        %V2T2 is valid
        I1T3 = (V1T3-(V2T3*R3T3)/(R2T3+R3T3))/((R1T3+R3T3)-(R3T3.^2)/(R2T3+R3T3)); %[A]
        I2T3 = (V2T3-(I1T2*R3T2)) / (R2T2+R3T2); %[A]
        I3T3 = I1T3 + I2T3; %[A]
    end
    V2Max2 = V2T3 - 0.001; % Adjusts the final value of V2 so that it is correct. 
    range_V2Max(R-14) = V2Max2; %Stores the Value of V2 in a Vector range_V2Max
    %Because R is 15, to get the first index value, we need to subtract 14
    %from R.
    
%Get the range of the minimum values
I1T3 = I1; % I1 for Task 3
    I2T3 = I2; % I2 for Task 3
    I3T3 = I3; % I3 for Task 3
    V1T3 = V1; % V1 for Task 3
    V2T3 = V2; % V2 for Task 3
    R1T3 = R1; % R1 for Task 3
    R2T3 = R2; % R2 for Task 3
    R3T3 = R;  % R3 for Task 3 - This is equal to R because the instructions specify that this value will be changing from 15 to 115
    while (I3T3 > I2T3) && (I1T3 < 1) && (I1T3 > 0) && (I2T3 < 1) ...
          && (I2T3 > 0) && (I3T3 < 1) && (I3T3 > 0)
        V2T3 = V2T3 - 0.001; %Starts at 15 and subtracts .001 until the conditions are not met. Passes values down to recalculate currents
        %Recalculate the Currents in order to check if the new current with
        %V2T2 is valid
        I1T3 = (V1T3-(V2T3*R3T3)/(R2T3+R3T3))/((R1T3+R3T3)-(R3T3.^2)/(R2T3+R3T3)); %[A]
        I2T3 = (V2T3-(I1T3*R3T3)) / (R2T3+R3T3); %[A]
        I3T3 = I1T3 + I2T3; %[A]
    end
    V2Min2 = V2T3 + 0.001; %stores the value of the minimum voltage at each pass of the for loop for the respective R resistance value.
    range_V2Min(R-14)= V2Min2;%Stores the Value of V2 in a Vector range_V2Min
    %Because R starts at 15, to get the first index value, we need to subtract 14
    %from R.
end

%}

end

