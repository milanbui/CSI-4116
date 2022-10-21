%--------------------------------------------------------------------------
% NAME       : Milan Bui
% INSTRUCTOR : Prof. Hwang
% COURSE     : CSI 4116.01
% DATE       : 23 September 2022
% ASSIGNMENT : Homework 1
% FILE       : hw.m
%--------------------------------------------------------------------------
% read photo
originalPng = imread("pittsburgh.png");

% IMAGE 1 -----------------------------------------------------------------

% Convert photo to grey ---------------------------------------------------
greyPng = rgb2gray(originalPng);

rows = height(greyPng);
cols = width(greyPng);
sz = [rows, cols];

% Find & save darkest pixel in the image >> NO LOOPS ---------------------- 
% Darker color = lower value

% Returns min value of each row and linear indeces of each min
[minList, linIndList] = min(greyPng, [], 2, "linear");

% Returns min, and the row of the min
[minVal, minRow] = min(minList);

% Returns list of row indeces and list of column indeces for mins
[rowList, colList] = ind2sub(sz, linIndList);

darkestPixel = [minRow, colList(minRow)];


% 31x31 square around darkest pixel. Make all pixels white (255) ----------
% Loops ok

k = (31 - 1) / 2;

for across = (darkestPixel(1) - k) : (darkestPixel(1) + k)

    for down = (darkestPixel(2) - k) : (darkestPixel(2) + k)

        greyPng(across, down) = 255;

    end


end


imwrite(greyPng, "new_image.png");


% 121x121 grey(150) square in center of IMAGE. NO LOOPS -------------------
k = (121 - 1) / 2;

centerRow = rows/2;
centerCol = cols/2;

centerRows = (centerRow - k) : (centerRow + k);
centerCols = (centerCol - k) : (centerCol + k);

% changes area of corresponding rows and columns to 150
greyPng(centerRows, centerCols) = 150;

% Save changed image as png (use imwrite)
imwrite(greyPng, "new_image.png");


% IMAGE 2 -----------------------------------------------------------------
%compute scalar average pixel value along each channel separately
copyPng = originalPng;

redAvg = mean(copyPng(:,:,1),'all');
greenAvg = mean(copyPng(:,:,2),'all');
blueAvg = mean(copyPng(:,:,3),'all');

% subtract each channel by scalar
copyPng(:, :, 1) = copyPng(:, :, 1) - redAvg;
copyPng(:, :, 2) = copyPng(:, :, 2) - greenAvg;
copyPng(:, :, 3) = copyPng(:, :, 3) - blueAvg;

% Save to new png image
imwrite(copyPng, "mean_sub.png");
