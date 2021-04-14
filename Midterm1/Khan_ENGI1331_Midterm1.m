%% ENGI 1331 Midterm 1
% Mubashar Khan
% Mubashar Khan

% Last Update: February 18, 2017

%% Part II - Midterm 1
%Name: Mubashar Khan
%Cougatnet Username: mmkhan8
%Student ID: 1512949

clc
clear

AllData = [0.8 1.3 1.0;1.2 1.9 1.1;1.1 2.5 0.3;1.5 1.4 0.8;0.4 0.8 0.7];
Span = [160 200 120];
Bridges = {'Bridge A','Bridge B','Bridge C'};
Days = {'Monday','Tuesday','Wednesday','Thursday','Friday'};

[row col] = size(Span);
[r c] = size(Bridges);
if col ~= c
    error('The data was input incorrectly and the program is stopping.')
end

Selection = menu('Which bridge would you like to analyze?',Bridges);

if Selection == 0
    error('No bridge was selected and program is stopping.')
end

DefLimit = input('Input a maximum acceptable deflection between 0 and 3 meters for the selected bridge: ');
if  (0 > DefLimit) || (DefLimit > 3)
    warning('This not withing the acceptable deflection. Rounding input to nearest value.')
    if DefLimit > 3
        DefLimit = 3;
    else
        DefLimit = 0;
    end
end

Name = input('What is the name of the person for whom this report is being prepared: ','s');

fprintf('\nBridge Deflection Report \nPrepared for: %s',Name)


maxDeflec = max(AllData(:,Selection));
minDeflec = min(AllData(:,Selection));
AverageDef = mean(AllData(:,Selection));

fprintf('\n\nBridge\t\tMaxDef\t\tMinDef\t\tAvgDef')
fprintf('\n%s\t%0.1f\t\t\t%0.1f\t\t\t%0.2f',char(Bridges(Selection)),maxDeflec,minDeflec,AverageDef)

if maxDeflec > DefLimit
    fprintf('\n%s exceeds the set bridge deflection limit by %0.1f meters',char(Bridges(Selection)),(maxDeflec - DefLimit))
end

maxdef = [max(AllData)];
DefPer = maxdef ./ Span;

broken = DefPer > 0.01;
count = sum(broken);

fprintf('\n\nThere are currently %0.0f bridge(s) in need of attention.\n\n',count)

BiggestDef = max(max(AllData));
[row1 col1] = find(AllData== BiggestDef);

fprintf('%s has the highest overall deflection of %0.1f meters on %s.',char(Bridges(col1)),BiggestDef,char(Days(row1))) 
d = length(Days);
AvgDefAll = [mean(AllData(1:d,:))]';

%FinalData = [AllData , Average];

