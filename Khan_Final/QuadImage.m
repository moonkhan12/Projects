function [Matrix, numPix] = QuadImage(Background,Boat)

[row, col, lay] = size(Background);

numPix = row.*col;

Quadrant1 = Background(1:row/2,1:col/2,:); %top left
Quadrant2 = Background(1:row/2,col/2:col,:); %top right
Quadrant3 = Background(row/2:row,1:col/2,:); % bottom left
Quadrant4 = Background(row/2:row,col/2:col,:); %Bottom right


red = Quadrant2(:,:,1);
green = Quadrant2(:,:,2);
blue = Quadrant2(:,:,3);

[r, c, l] = size(Quadrant2);
for i = 1:r
    for n = 1:c
        for k = 1:2
            if Quadrant2(i,n,k) > 0
                Quadrant2(i,n,2) = 0;
                Quadrant2(i,n,3) = 0;
            end
        end
    end
end

Boat = imresize(Boat,[r,c]);
red = Boat(:,:,1);
green = Boat(:,:,2);
blue = Boat(:,:,3);

%55 255 87
%clearspace = red == 55 & green == 255 & blue == 87;

%justship = cat(3,clearspace,clearspace,clearspace);

%Quadrant3 = Quadrant3(justship);

%{
for i = 1: r
    for n = 1:c
        for k = 1:l
            if Quadrant3 = 
                Matrix2(t+row2,h,d) = 1;
            else
                Matrix2(t+row2,h,d) = 0;
            end
        end
    end
end
new = logical(Matrix2);
%}

Matrix = [Quadrant1,Quadrant2;Quadrant3,Quadrant4];
%I couldnt remember a sinle thing about any of the image processing stuff
end
