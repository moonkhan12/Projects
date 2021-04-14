%% ENGI 1331 NAE Project Part 1C
% Mubashar Khan, Nelson Nguyen, Andrew Nguyen
% Last Update: March 29, 2017


% Carbon Sequestration Data Analysis:

clear
clc
close all

%Input Variables:
[num,txt,raw] = xlsread('Dataset.xlsx'); %imports complete dataset
text = importdata('text_Dataset.xlsx'); %imports an excel file containing only the columns which contained text from filtered_Dataset
numbers = importdata('numbers_Dataset.xlsx'); %imports an excel file containing only the columns which contained numbers from filtered_Dataset
[num1, txt1, raw1] = xlsread('filtered_Dataset.xlsx'); %imports the filtered dataset so that the currency used can be converted

%Converting Currency:
%Creating Variables to store the various types of currency 
US_Dollar = 'US Dollar';
Yen = 'Japenese Yen';
Aus_Dollar = 'Australian Dollar';
Pound = 'British Pound';
Euro = 'Euros';
Nor_Kroner = 'Norwegian Kroner';
Dan_Krone = 'Danish Krone';
Canadia = 'Canadian Dollar';

for i = 2:length(txt1)
    loc = strcmpi(US_Dollar, char(txt1(i,20))); %Checks to find where in filtered_Dataset the the currency needs to be converted
    if loc == 1
         numbers(i-1,2) = numbers(i-1,2) * 1; %Replaces the value of numbers(i-1,2) with the USD value
    end
end

for i = 2:length(txt1)
    loc = strcmpi(Yen, char(txt1(i,20))); %Checks to find where in filtered_Dataset the the currency needs to be converted
    if loc == 1
         numbers(i-1,2) = numbers(i-1,2) * .009; %Replaces the value of numbers(i-1,2) with the USD value
    end
end

for i = 2:length(txt1)
    loc = strcmpi(Aus_Dollar, char(txt1(i,20))); %Checks to find where in filtered_Dataset the the currency needs to be converted
    if loc == 1
         numbers(i-1,2) = numbers(i-1,2) * 0.77; %Replaces the value of numbers(i-1,2) with the USD value
    end
end

for i = 2:length(txt1)
    loc = strcmpi(Pound, char(txt1(i,20))); %Checks to find where in filtered_Dataset the the currency needs to be converted
    if loc == 1
         numbers(i-1,2) = numbers(i-1,2) * 1.24; %Replaces the value of numbers(i-1,2) with the USD value
    end
end

for i = 2:length(txt1)
    loc = strcmpi(Euro, char(txt1(i,20))); %Checks to find where in filtered_Dataset the the currency needs to be converted
    if loc == 1
         numbers(i-1,2) = numbers(i-1,2) * 1.08; %Replaces the value of numbers(i-1,2) with the USD value
    end
end

for i = 2:length(txt1)
    loc = strcmpi(Nor_Kroner, char(txt1(i,20))); %Checks to find where in filtered_Dataset the the currency needs to be converted
    if loc == 1
         numbers(i-1,2) = numbers(i-1,2) * 0.12; %Replaces the value of numbers(i-1,2) with the USD value
    end
end

for i = 2:length(txt1)
    loc = strcmpi(Dan_Krone, char(txt1(i,20))); %Checks to find where in filtered_Dataset the the currency needs to be converted
    if loc == 1
         numbers(i-1,2) = numbers(i-1,2) * 0.14; %Replaces the value of numbers(i-1,2) with the USD value
    end
end

for i = 2:length(txt1)
    loc = strcmpi(Canadia, char(txt1(i,20))); %Checks to find where in filtered_Dataset the the currency needs to be converted
    if loc == 1
         numbers(i-1,2) = numbers(i-1,2) * 0.75; %Replaces the value of numbers(i-1,2) with the USD value
    end
end

fprintf('You have started the data analysis for active Carbon Sequestration projects from around the world.\nThis program will analyze and display various bits of data based on certain specifications that you will make.\n')

pause(6) %Gives the user time to read the intro statement.

%At the very start of the program the user is given the choice to see the
%raw data file.
seeFile = menu('Would you like to see the raw data file?','Yes','No');
if seeFile == 1
    certain = menu('Are you sure you would like to see the data file? Changes made to the data file and saved will effect the program and might result in an error.','Continue','Go Back');
    if certain == 1
        warning('Changes made to the data file that are saved will impact the program and might result in an error.')
        winopen('Dataset.xlsx'); %Opens the unfiltered data containing all the data that text_Dataset and numbers_Dataset pulled from. 
        
        %<<<<< In the event that you accidently change 'Dataset.xlsx', you
        %can open up 'Original_Dataset.xlsx' and use Save As to restore the
        %excel file 'Dataset.xlsx' >>>>>
    end
end

Continue = menu('Would you like to analyze the data?','Yes','No');
if Continue == 0 || Continue == 2
    check = menu('Are you sure you don''t want to see the data analyzed?','Yes, I''m sure','No, I want to analyze the data'); 
end
if Continue == 1 || check == 2
    %Most successful project in terms of cost efficiency (cost/amount_stored)
    cost_efficiency = numbers(:,2) ./ numbers(:,3);      
    Most_efficient = min(cost_efficiency); %As the name suggests, this calculated the most cost efficient device 
    loc = find(cost_efficiency == Most_efficient);
    NameofBest = text(loc,1);
    if Most_efficient < 1
        Most_efficient = round(Most_efficient,2); % This ensures the value is a real currecny value
    end
    fprintf('\nSystem Data Analysis:\n')
    fprintf('\nThe most cost efficient device was %s, with a cost of $%0.2f per ton collected.', char(NameofBest), Most_efficient)
    
    %Least successful project in terms of cost efficiency (cost/amount_stored)
    Least_efficient = max(cost_efficiency);
    position = find(cost_efficiency == Least_efficient);
    NameofWorst = text(position,1);
    fprintf('\nThe least cost efficient device was %s, with a cost of $%0.2f per ton collected.', char(NameofWorst), Least_efficient)
    
    if (abs(Least_efficient - Most_efficient) / Most_efficient) > 100 %Checks to see if the percent difference is large or small 
        fprintf('\n\nBased off the values for the most and least efficient devices, it is safe to assume that \nthe cost of collecting carbon emissions is not directly linked to how much carbon is \nactually collected. This suggests that some devices such as %s \nare simply superior in terms of their efficiency.',char(NameofBest))
    end
   
    Count = 1;
    redo = 1; %defines redo to start the while loop
    while redo == 1 && Count < 11
        Decision = menu('What additional information would you like to see?','Continent with the most carbon captured','Most common used method of capturing/cleaning','Average carbon captured or stored per day','Average power used to capture carbon emissions','Graph of carbon captured in each continent');
        
        if Decision == 1
            fprintf('\n\n\n\n\n\n\n'); %Added to make the Command Window look less crowded
            fprintf('\n\nThe continent with the most carbon cleaned per day is North America.')
            total = sum(numbers(:,3));
            fprintf('\nA total of %0.0f tonnes of carbon is collected world-wide each day.',total)
            fprintf('\n\n\n\n\n\n\n'); %Added to make the Command Window look less crowded
            
        elseif Decision == 2
            Amines = 0;
            for i = 2:length(txt1)
                exists = strcmpi('Amines', char(txt1(i,16))); %Checks to find where in filtered_Dataset the the currency needs to be converted
                if exists == 1
                    Amines = Amines + 1; %Replaces the value of numbers(i-1,2) with the USD value
                end
            end
            
            Solvents = 0;
            for i = 2:length(txt1)
                exists = strcmpi('Solvents', char(txt1(i,16))); %Checks to find where in filtered_Dataset the the currency needs to be converted
                if exists == 1
                    Solvents = Solvents + 1; %Replaces the value of numbers(i-1,2) with the USD value
                end
            end
            
            EAS = 0;
            for i = 2:length(txt1)
                exists = strcmpi('Ethanol-amino solvent', char(txt1(i,16))); %Checks to find where in filtered_Dataset the the currency needs to be converted
                if exists == 1
                    EAS = EAS + 1; %Replaces the value of numbers(i-1,2) with the USD value
                end
            end
            
            Mitsubishi = 0;
            for i = 2:length(txt1)
                exists = strcmpi('Mitsubishi HI Gasification (KS-1)', char(txt1(i,16))); %Checks to find where in filtered_Dataset the the currency needs to be converted
                if exists == 1
                    Mitsubishi = Mitsubishi + 1; %Replaces the value of numbers(i-1,2) with the USD value
                end
            end
            
            Oxy = 0;
            for i = 2:length(txt1)
                exists = strcmpi('Oxy-fuel Combustion', char(txt1(i,16))); %Checks to find where in filtered_Dataset the the currency needs to be converted
                if exists == 1
                    Oxy = Oxy + 1; %Replaces the value of numbers(i-1,2) with the USD value
                end
            end
            
            AAT = 0;
            for i = 2:length(txt1)
                exists = strcmpi('Ammonia Absorption Technology', char(txt1(i,16))); %Checks to find where in filtered_Dataset the the currency needs to be converted
                if exists == 1
                    AAT = AAT + 1; %Replaces the value of numbers(i-1,2) with the USD value
                end
            end
            
            Matrix = [Amines, Solvents, EAS, Mitsubishi, Oxy, AAT];
            
            if max(Matrix) == Amines
                fprintf('\n\nThe most used process of capturing carbon emissions is Amines.')
                fprintf('\n\n\n\n\n\n\n\n'); %Added to make the Command Window look less crowded
                pause(2)
                more_info_Amines = menu('Would you like to learn more about Amines?','Yes','No');
            elseif max(Matrix == Solvents)
                fprintf('\n\nThe most used process of capturing carbon emissions is Solvents.')
                pause(2)
                more_info_Solv = menu('Would you like to learn more about Amines?','Yes','No');
            elseif max(Matrix == EAS)
                fprintf('\n\nThe most used process of capturing carbon emissions is Ethanol-amino solvent.')
                pause(2)
                more_info_EAS = menu('Would you like to learn more about Amines?','Yes','No');
            elseif max(Matrix == Mitsubishi)
                fprintf('\n\nThe most used process of capturing carbon emissions is Mitsubishi.')
                pause(2)
                more_info_Mit = menu('Would you like to learn more about Amines?','Yes','No');
            elseif max(Matrix == Oxy)    
                fprintf('\n\nThe most used process of capturing carbon emissions is Oxy-fuel Combustion.')
                pause(2)
                more_info_Oxy = menu('Would you like to learn more about Amines?','Yes','No');
            elseif max(Matrix == AAT)
                fprintf('\n\nThe most used process of capturing carbon emissions is Ammonia Absorption Technology.')
                pause(2)
                more_info_AAT = menu('Would you like to learn more about Amines?','Yes','No');
            end
            
            fprintf('\n\n\n\n\n\n\n\n'); %Added to make the Command Window look less crowded

            if more_info_Amines == 1
                url = 'http://www.psa.mhps.com/supportingdocs/forbus/hpsa/technical_papers/Advanced%20Amine-based%20CO2%20Capture%20for%20Coal-fired%20Power%20Plants.pdf';
                web(url,'-browser'); %Opens a new webpage on the system's default browser which leads to a document that further explains the best form of 
            
            elseif more_info_solv == 1
                url = 'https://sequestration.mit.edu/pdf/Anusha_Kothandaraman_thesis_June2010.pdf';
                web(url,'-browser');
            
            elseif more_info_EAS == 1
                url = 'https://www.google.com/webhp?sourceid=chrome-instant&ion=1&espv=2&ie=UTF-8#q=carbon+sequestration+by+Ethanol-amino+solvent&*';
                web(url,'-browser');
                
            elseif more_info_Mit == 1
                url = 'https://southerncompany.mediaroom.com/index.php?s=&item=2337'; 
                web(url,'-browser');
                
            elseif more_info_Oxy == 1
                url = 'http://www.ccsassociation.org/what-is-ccs/capture/oxy-fuel-combustion-systems/'; 
                web(url,'-browser');
                
            elseif more_info_AAT == 1
                url = 'https://sequestration.mit.edu/pdf/Anusha_Kothandaraman_thesis_June2010.pdf'; 
                web(url,'-browser');
            end
            
            
        elseif Decision == 3
            Average = mean(numbers(:,3));
            fprintf('\n\nThe average carbon collected through-out the world per day is %0.0f tonnes.',Average)
            fprintf('\n\n\n\n\n\n\n\n'); %Added to make the Command Window look less crowded
            
        elseif Decision == 4 
            Average = mean(numbers(:,1)); %finds the average power used per day
            Total_power = sum(numbers(:,1));
            total_Carbon = sum(numbers(:,3));
            fprintf('\n\nThe average Power used to capture carbon is %0.0f [Watts] per day',Average)
            fprintf('\nA total power of %0.0f [Watts] is used on a daily basis to capture %0.0f tonnes of carbon.',Total_power,total_Carbon)
            fprintf('\n\n\n\n\n\n\n'); %Added to make the Command Window look less crowded    
            
        elseif Decision == 5
            %Creates a Bar Graph
            %Graph 1
            %Initialize Variables:
            Africa = 2;
            Asia = 3;
            Australia = 7;
            Europe = 10;
            North_America = 35;
            South_America = 1;
            
            %Create a Vector to store each Variable in. The Vector is
            %necessary to adjust the color for each bar.
            Africa2 = [ Africa 0 0 0 0 0];
            Asia2 = [ 0 Asia 0 0 0 0];
            Australia2 = [ 0 0 Australia 0 0 0];
            Europe2 = [ 0 0 0 Europe 0 0];
            North_America2 = [ 0 0 0 0 North_America 0];
            South_America2 = [ 0 0 0 0 0 South_America];
            
            figure(1); %Shows the bar graph based on made up values to simply show the differences between the different continents. Of course this is extremely inaccurate but it it necessary to help explain in a general sense the relation between each continent's carbon emission capture rate.
            set(gcf,'Color',[1,1,1]);
            hold on;  
            bar(Africa2,'k');  
            bar(Asia2,'r');  
            bar(Australia2,'g');
            bar(Europe2,'b');
            bar(North_America2,'c');
            bar(South_America2,'y');
            legend('Africa', 'Asia', 'Australia', 'Europe', 'North America', 'South America', 'Location', 'northwest');
            title('Carbon Captured Visual Representation(Not to scale)')
            xlabel('Continents')
            ylabel('Carbon Captured in tonnes')
            
            %Graph 2
            %Initialize Variables:
            Africa = 3288;
            Asia = 91092.78;
            Australia = 215177.85;
            Europe = 4166573.86;
            North_America = 61945854.58;
            South_America = 2481.98;
            
            %Create a Vector to store each Variable in. The Vector is
            %necessary to adjust the color for each bar.
            Africa2 = [ Africa 0 0 0 0 0];
            Asia2 = [ 0 Asia 0 0 0 0];
            Australia2 = [ 0 0 Australia 0 0 0];
            Europe2 = [ 0 0 0 Europe 0 0];
            North_America2 = [ 0 0 0 0 North_America 0];
            South_America2 = [ 0 0 0 0 0 South_America];
            
            figure(2); %Shows the bar graph based on actual values.
            set(gcf,'Color',[1,1,1]);
            hold on;
            bar(Africa2,'k');
            bar(Asia2,'r');
            bar(Australia2,'g');
            bar(Europe2,'b');
            bar(North_America2,'c');
            bar(South_America2,'y');
            legend('Africa', 'Asia', 'Australia', 'Europe', 'North America', 'South America', 'Location', 'northwest');
            title('Carbon Captured True Representation')
            xlabel('Continents')
            ylabel('Carbon Captured [tonnes per day]') 
        elseif Decision == 0
            error('Program Terminated');
        end
        Count = Count + 1; 
        redo = menu('Would you like to choose another option?','Yes','No');
        %Warning Statement in the event that the user keeps repeating the
        %program. This will prevent the user from choosing another option
        %after their 10th time repeating the process.
        if Count == 10  
            fprintf('\n');
            warning('This is the final time you can make a choice.')
        end
    end
else
    error('Program Teriminated'); 
end

%This is just a little something extra we decided to add for anyone who
%actually went through the program a full 10 times. 
if Count == 11
    fprintf('\nThere were only 5 options to choose from and somehow you still used up all 11 of your tries.')
    fprintf('\nAfter reading through our code here is what you should be feeling like now>')
    redo = 0;
    pause(7)
    while redo < 2 %allows the gif to repeat 2 additional times
        for k = 1:50
            [img,map] = imread('giphy.gif','frames',k); %imports a series of image files that we used to simulate a gif
            figure(3);
            imshow(img,map); %Displays the gif
        end
    redo = redo + 1; 
    end
end

