%% ENGI 1331 NAE Project Part 1B
% Mubashar Khan, Nelson Nyugen, Andrew Nyugen
% Last Update: March 6, 2017

%% Carbon Sequestration Data Analysis

clear
clc

[num,txt,raw] = xlsread('Dataset.xlsx'); %imports complete dataset
text = importdata('text_Dataset.xlsx'); %imports an excel file containing only the columns which contained text from filtered_Dataset
numbers = importdata('numbers_Dataset.xlsx'); %imports an excel file containing only the columns which contained numbers from filtered_Dataset

fprintf('You have started the data analysis for active Carbon Sequestration projects from around the world.\nThis program will analyze and display various bits of data based on certain specifications that you will make.\n')

pause(6) %Gives the user time to read the intro statement.

%At the very start of the program the user is given the choice to see the
%raw data file. This is done so that 
seeFile = menu('Would you like to see the raw data file?','Yes','No');
if seeFile == 1
    certain = menu('Are you sure you would like to see the data file? Changes made to the data file and saved will effect the program and might result in an error.','Continue','Go Back');
    if certain == 1
        warning('Changes made to the data file that are saved will effect the program and might result in an error.')
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
    
    if (Least_efficient / Most_efficient) > 10000 
        fprintf('\n\nBased of the value for most and least efficient device, it is safe to assume that \nthe cost of collecting carbon emissions is not directly linked to how much carbon is \nactually collected. This suggests that some devices such as %s \nare simply superior in terms of their efficiency.',char(NameofBest))
    end
   
    Count = 1;
    redo = 1; %defines redo to start the while loop
    while redo == 1 && Count < 11
        Decision = menu('What additional information would you like to see?','Continent with the most carbon captured','Most common used method of capturing/cleaning','Average carbon captured or stored per day','Average power used to capture carbon emissions','Graph of carbon captured in each continent');
        
        if Decision == 1
            fprintf('\n\n\n\n\n\n\n'); %Added to make the Command Window look less crowded
            fprintf('\n\nThe continent with the most carbon collected per day is North America.') %This part will be unhardcoded in Part 1C once we can use loops
            total = sum(numbers(:,3));
            fprintf('\nA total of %0.0f tonnes of carbon is collected world-wide each day.',total)
            fprintf('\n\n\n\n\n\n\n'); %Added to make the Command Window look less crowded
            
        elseif Decision == 2
            fprintf('\n\nThe most used process of capturing carbon emissions is Amines.') %This part will be unhardcoded in Part 1C once we can use loops
            fprintf('\n\n\n\n\n\n\n\n'); %Added to make the Command Window look less crowded
            pause(2)
            more_info = menu('Would you like to learn more about Amines?','Yes','No');
            if more_info == 1
                url = 'http://www.psa.mhps.com/supportingdocs/forbus/hpsa/technical_papers/Advanced%20Amine-based%20CO2%20Capture%20for%20Coal-fired%20Power%20Plants.pdf';
                web(url,'-browser');
            end
        elseif Decision == 3
            Average = mean(numbers(:,3));
            fprintf('\n\nThe average carbon collected through-out the world per day is %0.0f tonnes.',Average)
            fprintf('\n\n\n\n\n\n\n\n'); %Added to make the Command Window look less crowded
        elseif Decision == 4 
            Average = mean(numbers(:,1));
            Total_power = sum(numbers(:,1));
            total_Carbon = sum(numbers(:,3));
            fprintf('\n\nThe average power used to capture carbon is %0.0f [Watts] per day',Average)
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
            title('Carbon Captured Visual Representation (Not to Scale)')
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
            ylabel('Carbon Captured in tonnes')   
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


