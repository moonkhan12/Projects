clear
clc
close all

%Problem Statement: The user will be allowed to repetitively specify a pair
                   %of experimental test values for a specific transistor 
                   %and store the response in the two-element vector Test. 
                   %The purpose of this assignment is to check data based
                   %off values on a graph.

                   
%Input Variables: 
%Test = user input [ohms Hz]

%Intermediate Variables:
%Voltage_Check = Stores the value in Test(1) for data validation purposes
%Frequency_Check = Stores the value in Test(2) for data validation purposes
counter = 0; %Defines counter to record the number of times the program is run 
redo = 1;% Defines redo to start the loop
%V = Vector that stores all valid Voltage values entered
%f = Vector that stores all valid frequncy values entered

while redo == 1
    again = 1; % Defines redo to start the while loop
    while again == 1
        Test = input('Enter the value of the voltage and frequency in a 1x2 Vector: '); 
        [row, col] = size(Test); %gets size of Test to start the Data Validation


        count = 1; %defines counts to start the loop
        while count < 3 && (row ~= 1 || col ~= 2) %checks to see if the value entered was valid
            Test = input('Enter the value of the voltage and frequency in a 1x2 Vector: ');
            count = count + 1;
            [row, col] = size(Test);
            if count == 3 && (row ~= 1 || col~= 2)
                error('Program Terminated') %Terminate the program if Count reaches 3 and user does not specify a valid set of data 
            end
        end

        Voltage_Check = Test(1); %Defines voltage as the first element of Test
        Frequency_Check = Test(2); %Defines frequency as the second element of Test

    
    %<<<<< NOTE: Instructions were not very clear about this: As long as 
    %the user enters a 2-element row vector and a voltage value as the 
    %first element in Test within the range of 0 and 15 volts inclusive, 
    %the program will follow these steps, if not the program will throw a 
    %warning for the user and loop them back to the beginning of the
    %program. 
    
    %This contradicts the following instructions: The program 
    %checks that the voltage entered is between 0 and 15 V and the 
    %Frequency is between 0 and 10000 Hz. If the user does not enter an 
    %appropriate value, ask the user to replace the value that is outside 
    %the specified range.
    
    %I chose to make the program loop while the voltage was not valid and
    %if the frequency was incorrect once the voltage is valid, the program
    %will prompt the user to change the value for frequency.>>>>>
    
        if (Voltage_Check > 15 || Voltage_Check < 0) %Checks to see if the voltage is within parameters
            warning('The value entered for the voltage was not acceptable')
            again = 1;
        else
            again = 2;
        end
    end


    while (Frequency_Check > 10000 || Frequency_Check < 0) %Loops this part until the user enters a valid frequency
        Frequency_Check = Test(2);
        if (Frequency_Check > 10000 || Frequency_Check < 0)
            Test(2) = input('Enter a frequency value between 0 and 10000 [Hz]: ');
        end
    end

    counter = counter + 1; %Each time this while loop is run, counter increase by 1

    %Create Vectors to store the values of Test(1) and Test(2)
    V(counter) = Test(1); %#ok<SAGROW> This just tells MATLAB to ignore the fact that V changes sizes. I dont like having warning notifications on the side of the scroll bar.
    f(counter) = Test(2); %#ok<SAGROW> This just tells MATLAB to ignore the fact that f changes sizes

    redo = menu('Would you like to enter new values?','Yes','No'); %Allows the user to choose if they want to enter more data points

end


%Output Variables: 
%Accepted = shows the number of accepted devices
%Rejected = shows the number of rejected devices

%Output:
%Just recreating the plot from the instructions. Nothing really special to
%explain here. Almost everyone's code for this will be the same. ~Sorta
%All graphs have been checked using a graphing calculator especially the
%power functions. 
figure('Color','w')
% Create Zone A:
x = [0,3]; %Created a vector to store the x and y coordinates because i was having an issue with simmly typing them into the plot function
y = [7500,7500];
plot(x,y,'-m','LineWidth',3)
hold on
x = [3,6];%Created a vector to store the x and y coordinates because i was having an issue with simmly typing them into the plot function
y = [7500,9000];
plot(x,y,'-m','LineWidth',3)
x = [6,6];%Created a vector to store the x and y coordinates because i was having an issue with simmly typing them into the plot function
y = [9000,6000];
plot(x,y,'-m','LineWidth',3)

x = [0.15,3,6];%Created a vector to store the x and y coordinates because i was having an issue with simmly typing them into the plot function
y = [1000,4244,6000];
power_Fit = polyfit(log10(x),log10(y),1);
m1 = power_Fit(1);
b1 = 10^power_Fit(2);
xpower = (0.0015:0.0001:6); %I just picked random numbers here within the bounds to increment by
ypower = b1 * xpower.^m1;
plot(xpower,ypower,'-m','LineWidth',3)

text(1.5,6500,'Zone A','BackgroundColor','w','Color','m','FontSize',16)
text(1.5,5500,'Accept','BackgroundColor','w','Color','m','FontSize',16)

%Create Zone B:
x = [12,15];%Created a vector to store the x and y coordinates because i was having an issue with simmly typing them into the plot function
y = [7500,7500];
plot(x,y,':b','LineWidth',3)
x = [8,8];%Created a vector to store the x and y coordinates because i was having an issue with simmly typing them into the plot function
y = [0,3000];
plot(x,y,':b','LineWidth',3)

x = [8,11,12];%Created a vector to store the x and y coordinates because i was having an issue with simmly typing them into the plot function
y = [3000,6000,7500];
power_Fit = polyfit(log10(x),log10(y),1);
m2 = power_Fit(1);
b2 = 10^power_Fit(2);
xpower = (8:0.0001:12);
ypower = b2 * xpower.^m2;
plot(xpower,ypower,':b','LineWidth',3)

%Instructions did not include a title so I did not add one.
grid
axis([0,15,0,10000])
set(gca,'XTick', 0:1:15); %Used this to modify the axis increments. Without this the increments were by 5's
xlabel('Voltage (V) [V]')
ylabel('Frequency (f) [Hz]')

text(10,3000,'Zone B','BackgroundColor','w','Color','b','FontSize',16)
text(10,2000,'Accept','BackgroundColor','w','Color','b','FontSize',16)

%Reject Text:
text(8,9000,'Reject','BackgroundColor','w','Color','k','FontSize',20)
text(3,2000,'Reject','BackgroundColor','w','Color','k','FontSize',20)

%Plot Red Dots:
plot(V,f,'or','MarkerFaceColor','r','MarkerSize',20)
for n = 1:counter
    Dot_Number = sprintf('%0.0f',n); %Stores the number of data point in n
    text(V(n)-.21,f(n)+35,Dot_Number,'FontSize',16) %Prints the number of data point on the dot
end

%Calculations:
Accepted = 0;
Rejected = 0;
[row, col] = size(V); %This row and col size should also be the same for f so I only need to get the size once

    for a = 1:col
        if V(a) <= 3 && (f(a) <= 7500 && f(a) >= b1*(V(a)).^m1) %Check to see if point is in Zone A
            status = 'Accept Device in Zone A';
            Accepted = Accepted + 1;
        elseif (V(a) <= 6 && V(a) > 3) && (f(a) <= (500*(V(a)) + 6000) && f(a) >= b1*(V(a)).^m1) %Check to see if point is in Zone A
            status = 'Accept Device in Zone A';
            Accepted = Accepted + 1;
        elseif (V(a) >= 8 && V(a) < 12) && (f(a) <= b2*(V(a)).^m2) %Check to see if point is in Zone B
            status = 'Accept Device in Zone B';
            Accepted = Accepted + 1;
        elseif V(a) >= 12 && (f(a) <= 7500) %Check to see if point is in Zone B
            status = 'Accept Device in Zone B';
            Accepted = Accepted + 1;
        else %If the point did not pass any of the previous 4 tests, then it is in the reject area
            status = char('Reject Device');
            Rejected = Rejected + 1;
        end
    end
    
%<<<<<NOTE: You will notice that the code repeats itself from above this
%comment to below it. The reason it repeats is to get the formated output
%correct. The first time all the program does is count the number of
%accepted and rejected devices whereas in the second time, the program
%prints the information.
    
    
%Formated Output:
fprintf('\n\nYour tests resulted in: \n')
fprintf('   %0.0f\tAccepted Devices\n',Accepted)
fprintf('   %0.0f\tRejected Devices\n',Rejected)


fprintf('\nEntry # | Voltage [V] | Frequency [Hz] | Status ')
for a = 1:col
    if V(a) <= 3 && (f(a) <= 7500 && f(a) >= b1*(V(a)).^m1) %Check to see if point is in Zone A
        status = 'Accept Device in Zone A';
        Accepted = Accepted + 1;
        fprintf('\n  %0.0f\t\t\t   %0.0f\t\t\t%0.0f\t\t   %s',a,V(a),f(a),status)
    elseif (V(a) <= 6 && V(a) > 3) && (f(a) <= (500*(V(a)) + 6000) && f(a) >= b1*(V(a)).^m1) %Check to see if point is in Zone A
        status = 'Accept Device in Zone A';
        Accepted = Accepted + 1;
        fprintf('\n  %0.0f\t\t\t   %0.0f\t\t\t%0.0f\t\t   %s',a,V(a),f(a),status)
    elseif (V(a) >= 8 && V(a) < 12) && (f(a) <= b2*(V(a)).^m2) %Check to see if point is in Zone B
        status = 'Accept Device in Zone B';
        Accepted = Accepted + 1;
        fprintf('\n  %0.0f\t\t\t   %0.0f\t\t\t%0.0f\t\t   %s',a,V(a),f(a),status)
    elseif V(a) >= 12 && (f(a) <= 7500) %Check to see if point is in Zone B
        status = 'Accept Device in Zone B';
        Accepted = Accepted + 1;
        fprintf('\n  %0.0f\t\t\t   %0.0f\t\t\t%0.0f\t\t   %s',a,V(a),f(a),status)
    else %If the point did not pass any of the previous 4 tests, then it is in the reject area
        status = char('Reject Device');
        Rejected = Rejected + 1;
        fprintf('\n  %0.0f\t\t\t   %0.0f\t\t\t%0.0f\t\t   %s',a,V(a),f(a),status)
    end
end
