%--------------------------------------------------------------------------
% NAME       : Milan Bui
% INSTRUCTOR : Prof. Hwang
% COURSE     : CSI 4116.01
% DATE       : 30 November 2022
% ASSIGNMENT : Homework 5
% FILE       : estimate_homogrophy.m
% DESCRIPTION: Computes a homography between the points from the first
%              image and second image. (Transform from image 1 to image 2)
%              
%              INPUTS:
%              PA - Nx2 matrix. Each row is the (x,y) coordinate in image 1
%                   of the matching points
%              PB - Nx2 matrix. Each row is the (x,y) coordinate in image 2
%                   of the matching points
%
%              OUTPUTS:
%              H - 3x3 matrix. homography between points of images
%--------------------------------------------------------------------------

function H = estimate_homography(PA, PB) 

    % Set up system of equations A as shown in slides
    numOfPoints = height(PA);
    A = zeros(2*numOfPoints, 9);
    
    i = 1;
    row = 1;

    while i <= numOfPoints && row <= height(A)
        currentA = [-PA(i,1), -PA(i,2), -1, 0, 0, 0, PA(i,1)*PB(i,1), PA(i,2)*PB(i,1), PB(i,1);...
                    0, 0, 0, -PA(i,1), -PA(i,2), -1, PA(i,1)*PB(i,2), PA(i,2)*PB(i,2), PB(i,2)];
        A(row:row+1, :) = currentA;
        row = row + 2;
        i = i+1;
    end

    % Solve for H
    [~,~,V] = svd(A);
    h = V(:, end);
    H = reshape(h, 3, 3)';



end
