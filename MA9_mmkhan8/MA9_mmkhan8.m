%% ENGI 1331 MA9
% Mubashar Khan
% Last Update: April 18, 2017

%% MA9 Problem #1: Sobel Edge Detection

clear
clc
close all

%Problem Statement: Detect the edge of objects using Sobel Edge Detection

%Input Variable:
%crystal = imported image
crystal = imread('crystals.jpeg'); %Imports the image

[row, column, layer] = size(crystal); %Gets the number of pixels(row*column) and the number of layers

%Task 1: Convert to Grayscale
%intensity = 0.2989*red + 0.5870*green + 0.1140*blue
    %Seperate the layers into 3 colors RGB
    red = crystal(:,:,1); 
    green = crystal(:,:,2); 
    blue = crystal(:,:,3);

    intensity = 0.2989*red + 0.5870*green + 0.1140*blue;
    
%Task 2: Create the two new matrices defined as the horizontal and vertical sobel kernels using the exact matrices
%shown in the background for this problem.
    horizontal = [-1 -2 -1;0 0 0; 1 2 1];
    verticle = [-1 0 1;-2 0 2;-1 0 1];

%Task 3: Convolve the new image with the sobel kernels using conv2
    %Horizontal = conv2(double(rgb2gray(crystal)),double(horizontal)); %rgb2gray converts to greyscale. the variable intensity does not create the image correctly.
    %Verticle = conv2(double(rgb2gray(crystal)),double(verticle)); %You can uncomment the following 2 lines and see what happens when the program uses intensity instead of rgb2gray to get grayscale
    %Previous lines do the same thing as following 2 lines, Previous lines just save a step.
    Horizontal = conv2(double(intensity),double(horizontal)); 
    Verticle = conv2(double(intensity),double(verticle));
    

%Task 4: I added titles to each graph. ~not specified by instructions
figure
subplot(2,2,1) %Top Left
image(crystal)
title('Original')

subplot(2,2,2) %Top Right
image(abs(Horizontal))
title('Normalized Horizontal Edge')

new_Var = (Horizontal.^2 + Verticle.^2).^(0.5);
subplot(2,2,3) %Bottom Left
image(new_Var)
title('Normalized Cross Correlization')

subplot(2,2,4) %Bottom Right
image(abs(Verticle))
title('Normalized Verticle Edge')



%% MA9 Problem #2: Where's Waldo?

clear
clc
close all

%Problem Statement: Find Waldo using image processing without using
                    %implicit loops(Find,:, Built in Image Processing
                    %functions).

%Input Variables:
%Import the Image Files
Waldo1 = imread('P2_Waldo2.png');
Map = imread('P2_wheresWaldo2.jpg');

%Intermediate Variables:
    [row1, col1, layer1] = size(Waldo1);
    [row2, col2, layer2] = size(Map);
    redWaldo1 = Waldo1(:,:,1); %Rather than working with all 3 layers, I decided to check only 1 layer which in this case was red.
    redMap = Map(:,:,1);       %This sped up my program significantly from  8-9 seconds to about 1 second

%Variables used in the function: 
    %Waldo_sqr1 = sum of outer corners
    %Waldo_sqr2 = sum of outer corners - 1 level
    %Waldo_sqr3 = sum of outer corners - 2 level
    %Waldo_sqr4 = sum of outer corners - 3 level
    
    
%Check to make sure the size of each waldo pic is smaller than the associated map
    if row1 > row2 || col1 > col2
        error('Program Terminated: Waldo is bigger than the Map')
    end

%Output Variables:
%{
    yxoor1 = upper left y value of Waldo
    xcoor1 = x value of ycoor1
    ycoor2 = lower right y value of Waldo
    xcoor2 = x value of ycoor2
%}

%Calculations
[ycoor1,ycoor2,xcoor1,xcoor2] = getLocation(redWaldo1,redMap); %Calls the function getLocation

%Output:
figure
image(Map)
hold on %Lets me add a rectangle on top of the image
title('Where''s Waldo?')
axis on %Turns on the axis
set(gcf, 'Position', [100, 55, 800, 600]) %Changes the size of the window that is opened
rectangle('position',[xcoor1 ycoor1 col1 row1],'edgecolor','r','linewidth',4); %Creates a rectangle starting at point (xcoor1,ycoor1) and going over a distance of col1 and going down a distance of row1
fprintf('Waldo can be found between y = %0.0f & %0.0f and x = %0.0f & %0.0f.',ycoor1,ycoor2,xcoor1,xcoor2)


