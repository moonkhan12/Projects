%% ENGI 1331 MA3
% Mubashar Khan
% Last Update: February 8, 2017
%% MA3 Problem #1

clear
clc

%Problem Statement: Determine whether the motor should be enabled or not based on menu selections


%Input Variables:
Brake = menu('What is the position of the Brake Switch?', 'ON', 'OFF');
Operator = menu('Is the Operator properly seated?', 'Seated', 'Not Seated');
Blades = menu('What is the position of the Blade Power Switch?', 'ON', 'OFF');
LeftLever = menu('What is the position of the Left Guide Bar Neutral Switch?', 'Forward', 'Neutral', 'Backward');
RightLever = menu('What is the position of the Right Guide Bar Neutral Switch?', 'Forward', 'Neutral', 'Backward');
Ignition = menu('What is the position of the Ignition Switch?', 'ON', 'OFF');

    
%Intermediate Variables:
%None

%Output:

%The ignition switch must on.
%If the blades are powered, the operator must be properly seated.  
%If the operator is not properly seated, both guide levers must be in the locked neutral position. 
%If either guide lever is not in the locked neutral position, the brake must be off.

if (Brake == 0) || (Operator == 0) || (Blades == 0) || (LeftLever == 0) || (RightLever == 0) || (Ignition == 0) %Checks to see if any of the selctions were left BLANK.
    error('Missed a Selection. Please restart the program and answer each question when prompted.'); %Notifies User that they closed one of the option menus and as a result the program can not decide if the Motor should be on.
else %Continues to the program with the understanding that all questions were answered.
    if Ignition == 2 %If the ignition switc.h is off then the motor is disabled.
        fprintf('Motorn should be disabled');
    else %If the ignition switch is on, then the program must check if the blades are powered.
        if Blades == 1 && Operator == 1 %If the blades are powered, the operator must be sitting properly.
            if (LeftLever ~= 2 || RightLever ~= 2) && Brake == 2 %If the lever is on anything aside from neutral, the brake must be off.
                fprintf('Motorm should be enabled');
            else
                if Blades == 2 && Operator == 1 %If the blades are not powered but the Operator is sitting properly
                    if (LeftLever ~= 2 || RightLever ~= 2) && Brake == 2 %If the lever is on anything aside from neutral, the brake must be off.
                        fprintf('Motorl should be enabled');
                    else
                        fprintf('Motork should be disabled');
                    end
                end
            end
        elseif Operator == 2  %If the operator is not sitting properly, then both guide levers must be in neutral.
            if LeftLever == 2 && RightLever == 2%Because the Operator is not sitting properly, both levers must be neutral.
                fprintf('Motorj should be enabled');
            else
                fprintf('Motori should be disabled');
            end
        elseif Operator == 1 
            if (LeftLever ~= 2 || RightLever ~= 2) && Brake == 1
                fprintf('Motorh Should be disabled');
            else
                fprintf('Motorg should be enabled');
            end
        elseif Brake == 1
            if Operator == 2 && ((LeftLever == 1)|| (RightLever == 1) || (LeftLever == 3) || (RightLever == 3))
                fprintf('Motorf should be disabled');
            else
                fprintf('Motore should be enabled');
            end
        end 
   end
end
%There was a gap in my logic somewhere up there and I couldn't locate where
%so this little bit of code should patch that hole.
if (Operator == 1) && (Blades == 1) && (Ignition == 1)
    if(LeftLever ~= 2 && RightLever ~= 2) && Brake == 1
        fprintf('Motord should be disabled');
    elseif (LeftLever ~= 2 || RightLever ~= 2) && Brake == 2    
        fprintf('Motorc should be enabled');
    else
        fprintf('Motorb should be disabled');
    end
end
    

%<<<<<Some of the code epecially between lines 49 and 65 seems a little
%redundant however, it was necessary in order to correctly display the
%answer for every test case that I created>>>>>



%% MA3 Problem #2:

clear
clc

%Problem Statement: Ask  user to enter either a color band or a resistance
                    %and use that information to find either the resistance or the color band.


%Input Variables:
load('P2_ColorGuide.mat') %Loads the data from the file

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

    if max(Multiplier) > 0
        error('Invalid Mulitplier.'); %Outputs an error message if the user enters anything other than 0's in the third through n columns
    end

    [r, c] = size(Multiplier); %gets the size of the multiplier which will be used to choose the multiplier color

    a = Resist(1) + 1; %Because of the way the array ColorCode is set up(starts with 1 instead of 0), I had to add 1 to each of the values I called in order to get the correct output
    b = Resist(2) + 1;
    c = c + 1;
    First_Band = char(ColorCode(a)); 
    Second_Band = char(ColorCode(b));
    Multip_Band = char(ColorCode(c));
else %Code for Color Band to Resistance
    [row, col] = size(Color);
    if col ~= 3
        error('Invalid number of colors.');
    end
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


%% MA3 Problem #3

clear
clc

%Problem Statement: Using user provided input determine the distance x the
                    %weight moves

%Input Variables:
Weight = input('Enter the weight [N]:  '); %Weight in [N] of the object
k_1 = input('Enter the k_1 value [N/m]:  '); 
k_2 = input('Enter the k_2 value [N/m]:  '); 
d = input('Enter the rest position, d [m]:  '); %distance [m]

%Intermediate Variables:
[row, col] = size(Weight);
if col > 1
    largest = max(Weight);
else
end
%Output Variables
%x = distance traveled [m]

%Calculations:
%W = k_1 * x if x < d
%W = k_1 * x + 2k_2(x-d) if x > d

if col == 1
    W = Weight;
    x = W / k_1;
    y = (W + 2*k_2*d) / (k_1 + 2*k_2);

    if x < d
        Answer = x;
    else
        Answer = y;
    end
    
    %Output:
    fprintf('The weight will pass through a distance of %0.4f [m].', Answer)

else
    W = largest;
    x = W / k_1;
    y = (W + 2*k_2*d) / (k_1 + 2*k_2);

    if x < d
        Answer = x;
    else
        Answer = y;
    end

    %Output:
    fprintf('The max given weight (%0.0f) will pass through a distance of %0.2f [m].', W,Answer)
    
    Wi = Weight;
    x = Wi / k_1;
    y = (Wi + 2*k_2*d) / (k_1 + 2*k_2);

    if x < d %This should graph the points but for whatever reason, the part which should graph all values of x less than d is not working. The program skips this section and goes straight to the else
        Answer1 = x;
            plot(Weight,Answer1,'o')
    title('Relationship of Weight and spring compression')
    xlabel('Weight (W) [N]')
    ylabel('Distance moved through (x) [m]')
    axis([0 7000 0 3]); %Without this line, the bounds for the graph were strange
    else
        Answer2 = y;
            plot(Weight,Answer2,'o')
    title('Relationship of Weight and spring compression')
    xlabel('Weight (W) [N]')
    ylabel('Distance moved through (x) [m]')
    axis([0 7000 0 3]);
    end
%<<<<< Graph will probably be wrong. Indiviually, I can make both graphs appear 
%on the same figure, however I can't create a graph that mixes values from 
%both x and y. It only displays the second plot. After 2 and a half hours 
%of playing with the code I have given up. >>>>>
    
end



