%--------------------------------------------------------------------------
% NAME       : Milan Bui
% INSTRUCTOR : Prof. Hwang
% COURSE     : CSI 4116.01
% DATE       : 30 November 2022
% ASSIGNMENT : Homework 5
% FILE       : mosaic.m
% DESCRIPTION: Load images, select matching points, compute a homography,
%              apply it to a new point from the first image, and stitch a 
%              mosaic from the two images.
%              
%              INPUTS:
%              img1
%              img2
%              PA
%              PB
%
%              OUTPUTS:
%              canvas
%--------------------------------------------------------------------------

function [canvas] = mosaic(img1, img2, PA, PB)
    H = estimate_homography(PA, PB);
    numRows = size(img2, 1);
    numCols = size(img2, 2);

    % Creates new canvas and places image 2 in the center
    canvas = uint8(zeros(3*numRows, 3*numCols, 3));
    canvas(numRows:2*numRows-1, numCols:2*numCols-1, :) = img2;

    for x = 1 : width(img1)
        for y = 1 : height(img1)

            p1 = [x, y];
            p2 = apply_homography(p1, H);
            xFloor = floor(p2(1,1)) + numCols;
            xCeil = ceil(p2(1,1)) + numCols;
            yFloor = floor(p2(1,2)) + numRows;
            yCeil = ceil(p2(1,2)) + numRows;

            % Switch x and y as image coordinate x = col and y = row
            canvas(yFloor, xFloor, :) = img1(y, x, :);  
            canvas(yFloor, xCeil, :) = img1(y, x, :); 
            canvas(yCeil, xFloor, :) = img1(y, x, :); 
            canvas(yCeil, xCeil, :) = img1(y, x, :); 
        end
    end


end