%% ENGI 1331 Project 2: Circuit Analysis
% Mubashar Khan, Nelson Nguyen, Andrew Nguyen
% Last Update: April 28, 2017

clear
clc
close all

%Problem Statement: Using Ohm's Law and Kirchoff's Loop rules, solve the
                    %given circuit for currents (I1, I2, I3). Use Kirchoff’s 
                    %laws to analyze a circuit in order to calculate the 
                    %currents in their respective resistors and find the 
                    %allowable limits for voltage using a system of linear equations. 
%{
                    
Input Variables:
V1 = Voltage from power source 1 [V]
V2 = Voltafe from power source 2 [V]
R1 = Resistance 1 [ohms]
R2 = Resistance 2 [ohms]
R3 = Resistance 3 [ohms]
                    

Intermediate Variables:
I1T2 = I1; % I1 for Task 2
I2T2 = I2; % I2 for Task 2
I3T2 = I3; % I3 for Task 2
V1T2 = V1; % V1 for Task 2
V2T2 = V2; % V2 for Task 2
R1T2 = R1; % R1 for Task 2
R2T2 = R2; % R2 for Task 2
R3T2 = R3; % R3 for Task 2

I1T3 = I1; % I1 for Task 3
I2T3 = I2; % I2 for Task 3
I3T3 = I3; % I3 for Task 3
V1T3 = V1; % V1 for Task 3
V2T3 = V2; % V2 for Task 3
R1T3 = R1; % R1 for Task 3
R2T3 = R2; % R2 for Task 3
R3T3 = R;  % R3 for Task 3 - This is equal to R because the instructions specify that this value will be changing from 15 to 115


Output Variables:
Array_Task1 = formatted output of the Calculated data for Task 1
I1 = (V1-(V2*R3)/(R2+R3))/((R1+R3)-(R3.^2)/(R2+R3)) Calculated current 1 [A] 
I2 = (V2-(I1*R3)) / (R2+R3) Calculated current 2 [A]
I3 = I1 + I2 Calculated current 3 [A]

V2Max1 = stores the maximum Voltage that the circuit can have while having a current that is less than 1[A]
V2Min1 = stores the minimum Voltage that the circuit can have while having a current that is less than 1[A]
x = [15:115] - X values of the plot
range_V2Min = stores the value of V2Min2 to be used as the Y values on the plot
range_V2Max = stores the value of V2Max2 to be used as the Y values on the plot
                    
largest = max(range_V2Max); %Stores the largest value of range_V2Max
smallest = min(range_V2Min); %Stores the smallest value of range_V2Min
average = (largest + smallest) ./ 2; %Takes the average of the smallest and largest values

%}

%Call the functions:
[V1,V2,R1,R2,R3] = VR(); %Imports the variables [V1,V2,R1,R2,R3] Test Case 1
%[V1,V2,R1,R2,R3] = VR2(); %Imports the variables [V1,V2,R1,R2,R3] Test Case 2
%[V1,V2,R1,R2,R3] = VR3(); %Imports the variables [V1,V2,R1,R2,R3] Test Case 3

[I1,I2,I3,V2Max1,V2Min1,range_V2Min,range_V2Max] = CircuitSolver(V1,V2,R1,R2,R3); %Imports the variables [I1,I2,I3]

V1 = abs(V1); %Converts value to a positive number
V2 = abs(V2); %Converts value to a positive number
R1 = abs(R1); %Converts value to a positive number
R2 = abs(R2); %Converts value to a positive number
R3 = abs(R3); %Converts value to a positive number
%This insures that all values entered for any test case are positive
%numbers.


%Task 1:
Array_Task1 = {'Voltage [V]' 'Resistance [Ohms]' 'Current [A]'; V1 R1 I1; V2 R2 I2; ' ' R3 I3};

fprintf('Task 1: Applying Kirchoff’s Laws \n')
disp(Array_Task1)

%Task 2:
fprintf('\nTask 2:  Current Effects on Voltage\n')
fprintf('The minimum voltage that can be used for this circuit is : %0.3f [V]\n',V2Min1)
fprintf('The maximum voltage that can be used for this circuit is : %0.3f [V]\n',V2Max1)


%Task 3:
%Plot the graph of the minimum and maximum range of the Voltage with
%respect to the resitance
figure(1)
x = (15:115); %Defines the x values for the plot
plot(x,range_V2Min,'rs','MarkerSize',5,'MarkerFaceColor','r')
hold on
plot(x,range_V2Max,'bo','MarkerSize',5,'MarkerFaceColor','b')
grid on
axis([0,120,0,120])
xlabel('Resistance (R) [Ohms]')
ylabel('Voltage (V) [V]')
title('Resitance Effects on Voltage')
legend('Minimum Voltage Range','Maximum Voltage Range')

fprintf('\n\nTask 3: Resistance Effects on Voltage\n')

largest = max(range_V2Max); %Stores the largest value of range_V2Max
smallest = min(range_V2Min); %Stores the smallest value of range_V2Min
average = (largest + smallest) ./ 2; %Takes the average of the smallest and largest values
fprintf('\nThe maximum value of V2 is %0.2f [V]\n',largest)
fprintf('The minimum value of V2 is %0.2f [V]\n',smallest)
fprintf('The average value of V2 is %0.2f [V]\n\n',average)

%Questions:
fprintf(' Questions: 1. What is the relationship between voltage and resistance?\n\t\t\t2. What would you look for in optimizing the voltage range for the circuit? \n')
%Answer to question 1
fprintf('\n Answer: 1. There is a direct relationship between voltage and resistance. As resistance increases, \n\t\t    the maximum voltage that the circuit can handle with currents less than 1A decreases while\n\t\t    the minimum voltage increases. This is modeled by Ohm''s Law which states: Voltage is \n\t\t    equal to the current times the resistance in a wire.')
%Answer to question 2
fprintf('\n\t\t 2. I would look for the minimum voltage nessesary to power the whole circuit and set that \n\t\t    as the voltage limit. This way I make the circuit more power efficient and if this circuit \n\t\t\tis a part of a large machine, it can potentially increase that machine''s life span')
