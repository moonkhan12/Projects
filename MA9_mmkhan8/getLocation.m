function [ycoor1,ycoor2,xcoor1,xcoor2] = getLocation(redWaldo1,redMap)
    [r1, c1, ~] = size(redWaldo1); %Redid the size so I wouldn't have to import a lot of variables
    [r2, c2, ~] = size(redMap); %Redid the size so I wouldn't have to import a lot of variables
    %The ~ subsitites for a var so the matrix doesnt store any value there
    
    %To locate where waldo is, I took the four corners of the waldo picture
    %4 levels in. Meaning it looked something like this:
    %{
       ______________________
       | x                x |      1,1     1,c
       |   x            x   |      2,2     2,c-1
       |     x        x     |      3,3     3,c-2
       |       x    x       |      4,4     4,c-3
       |                    |
       |       x    x       |      r-3,4   r-3,c-3   
       |     x        x     |      r-2,3   r-2,c-2
       |   x            x   |      r-1,2   r-1,c-1  
       | x                x |      r,1     r,c
       |____________________|
    
   
    This Program will take about 1 second to finish
        
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    The most efficient code(in terms of code written) I could create was: 
    cO = normxcorr2(redWaldo1, redMap); %Checks every value of redMap to see if it matches redWaldo
    [largest, Ind] = max(abs(cO(:)));  
    [y_point, x_point] = ind2sub(size(cO),Ind(1)); stores the x and y location of the starting point at which the matrix match 
    coordinate = [(x_point-col1) (y_point-row1)]; Stores the x and y location of the ending point
    
    Average time was about 4 seconds   
    However, because of the rules, this wasn't allowed
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    I tried to recreate that above code except using for loops, but that
    proved to be very difficult.
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    The following code checks the 4 corners at 4 levels and then adds them
    up. Then it compares it to the bigger image as the (i,n) changes.
    
    %}
    
    %1. Outer Corners
    Waldo_sqr1 = double(redWaldo1(1,1)) + double(redWaldo1(1,c1)  ) + double(redWaldo1(r1,1)  ) + double(redWaldo1(r1,c1)    );%Wouldn't work without adding double. Gets the sums of the four corners
    %2. Outer Corners - 1
    Waldo_sqr2 = double(redWaldo1(2,2)) + double(redWaldo1(2,c1-1)) + double(redWaldo1(r1-1,2)) + double(redWaldo1(r1-1,c1-1)); %Gets the sums of the four corners
    %3. Outer Corners - 2
    Waldo_sqr3 = double(redWaldo1(3,3)) + double(redWaldo1(3,c1-2)) + double(redWaldo1(r1-2,3)) + double(redWaldo1(r1-2,c1-2));%Gets the sums of the four corners
    %4. Outer Corners - 3
    Waldo_sqr4 = double(redWaldo1(4,4)) + double(redWaldo1(4,c1-3)) + double(redWaldo1(r1-3,4)) + double(redWaldo1(r1-3,c1-3)); %Gets the sums of the four corners
    
    
    for y = 1:r2-r1 %Because the code checks square sections that are equal to row1xcol1 the total area for the for loop must be reduced by that ammount
        for x = 1:c2-c1 %If I didnt reduce the bounds, there is an index exceeds error
            %If the sum of Waldo_pos1 ~= the sum of the four corners of
            %Map(y,x) at its respective points,  then the program keeps
            %advancing. Once a point matches, the x and y locations are
            %saved for use for the creation of the rectangular outline
            if double(redMap(y,x)) + double(redMap(y,x + (c1-1))) + double(redMap(y + (r1-1),x)) + double(redMap(y + (r1-1),x + (c1-1))) == Waldo_sqr1...                 %Compares Map(y,x) to Waldo_sqr1 to see if the sums match
                    && double(redMap(y + 1,x + 1)) + double(redMap(y + 1,x + (c1-2))) + double(redMap(y + (r1-2),x + 1)) + double(redMap(y + (r1-2),x + (c1-2))) == Waldo_sqr2... %Compares Map(y,x) to Waldo_sqr2 to see if the sums match
                    && double(redMap(y + 2,x + 2)) + double(redMap(y + 2,x + (c1-3))) + double(redMap(y + (r1-3),x + 2)) + double(redMap(y + (r1-3),x + (c1-3))) == Waldo_sqr3... %Compares Map(y,x) to Waldo_sqr3 to see if the sums match
                    && double(redMap(y + 3,x + 3)) + double(redMap(y + 3,x + (c1-4))) + double(redMap(y + (r1-4),x + 3)) + double(redMap(y + (r1-4),x + (c1-4))) == Waldo_sqr4    %Compares Map(y,x) to Waldo_sqr4 to see if the sums match
                %if in any of the previous 4 situations the pixels dont
                %match in the shade of red then the program moves to the
                %next value for (y,x) in redMap
                xcoor1 = x; %stores the starting x coordinate
                ycoor1 = y; %Stores the starting y coordinate
                
                xcoor2 = x + (c1 - 1); %Stores the ending x value
                ycoor2 = y + (r1 - 1); %Stores the final y value
            end
        end
    end
%{
<<<<<NOTE:  I tried to directly compare redMap to redWaldo1 and
 that didn't work well or efficiently. I had a five level for loop that
 took about 20 minutes to resolve. r1 * r2 * c1 * c2 * layer1 = Huge
 value.>>>>>
 %}
                       
end
