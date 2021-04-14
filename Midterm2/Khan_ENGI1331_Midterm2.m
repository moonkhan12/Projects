%% ENGI 1331 Midterm 2
% Mubashar Khan

% Last Update: March 25, 2017

% Part II - Midterm 2
%Name: Mubashar Khan
%Cougatnet Username: mmkhan8
%Student ID: 1512949

clear
clc

Velocity = importdata('Midterm2.csv');

[row, col] = size(Velocity);

for i = 1:row
    for n = 1:col
        while Velocity(i,n) <= 0
            fprintf('Replace cell(%0.0f,%0.0f) with a value greater than zero:',i,n)
            Velocity(i,n) = input('');
        end
    end
end

Vel_limit = input('Enter a maximum allowable limit for the velocity in m/s: ');
while Vel_limit > 15000 || Vel_limit < 13500
    Vel_limit = input('Enter a maximum allowable limit for the velocity in m/s: ');
end

k = 0;

for i = 1:row
    for n = 1:col
        if Velocity(i,n) > Vel_limit
            Velocity(i,n) = Vel_limit;
            k = k + 1;
            Velinfo(1,k) = i;
            Velinfo(2,k) = n;
        end
    end
end

fprintf('\n The total number of changes made were %0.0f', k)

fprintf('\n\t Row#\tCol#')
for h = 1:k
    fprintf('\n\t %0.0f\t\t%0.0f',Velinfo(1,h),Velinfo(2,h))
end


%Sorting

redo = 1;
while redo == 1
    SortCol = input('\n\nEnter the column number to be sorted: ');


    VelCol = Velocity(:,SortCol);

    for g = 2:length(VelCol) - 1
        if VelCol(g) < VelCol(g-1)
            temporary = VelCol(g);
            SortedVelocity(g) = VelCol(g-1);
            SortedVelocity(g-1) = temporary;
        else
            SortedVelocity(g) = VelCol(g);
        end
    end
    
    SortedVelocity = sort(VelCol); %I did this just so that I could continue to the next parts
   
    fprintf('\nColumn %0.0f before sorting\t Column %0.0f after sorting',SortCol,SortCol)
    for h = 1:length(VelCol)
        fprintf('\n%0.0f\t\t\t\t\t%0.0f',VelCol(h),SortedVelocity(h))
    end
    
    
    m1 = SortedVelocity(1);
    m2 = SortedVelocity(2);
    
    for u = 1:length(VelCol)
        NormVelocity(u,1) = (VelCol(u,1) - m1)/(m2-m1);
    end
    
    csvwrite('NormVelocity.csv',NormVelocity)
    redo = menu('Would you like to sort and normalize a different column of the Velocity matrix?', 'Yes', 'No');
end


