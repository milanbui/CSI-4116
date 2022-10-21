%--------------------------------------------------------------------------
% NAME       : Milan Bui
% INSTRUCTOR : Prof. Hwang
% COURSE     : CSI 4116.01
% DATE       : 21 October 2022
% ASSIGNMENT : Homework 3
% FILE       : extract_keypoints.m
%--------------------------------------------------------------------------

function [x, y, scores, Ih, Iv] = extract_keypoints(image)
%% extract_keypoints
% input:
%   image: colored image. Not grayscale or double yet.
% output:
%   x: n x 1 vector of x (col) locations that survive non-maximum suppression. 
%   y: n x 1 vector of y (row) locations that survive non-maximum suppression.
%   scores: n x 1 vector of R scores of the keypoints correponding to (x,y).
%   Ih: x- (horizontal) gradient. Also appeared as Ix in the slides.
%   Iv: y- (vertical) gradient. Also appeared as Iy in the slides.

% The kernels are provided, but you can try other kernels.
Ih_kernel = [1 0 -1; ...
             2 0 -2; ...
             1 0 -1];
Iv_kernel = Ih_kernel';

%% [10 pts] Part A: Setup (Implement yourself)
k = 0.05;
windowSize = 5;
greyImage = double(rgb2gray(image));

Ih = imfilter(greyImage, Ih_kernel);
Iv = imfilter(greyImage, Iv_kernel);

R = zeros(height(greyImage), width(greyImage));


%% [15 pts] Part B: R score matrix (Implement yourself
offset = (windowSize - 1) / 2;

% for each pixel in the image (i,j) / candidate keypoint
for i = 1 : height(greyImage)
    for j = 1 : width(greyImage)

        M = zeros(2,2); % create new Matrix

        % if pixel is on border, R score = -Inf
        if i <= offset || i > height(greyImage)-offset
            R(i,j) = -Inf;
        elseif j <= offset || j > width(greyImage)-offset
            R(i,j) = -Inf;
        else

            % for each pixel in the window
            M(1,1) = sum(sum(Ih(i - offset : i+offset, j-offset : j+offset).^2));
            M(1,2) = sum(sum(Ih(i - offset : i+offset, j-offset : j+offset).*Iv(i - offset : i+offset, j-offset : j+offset)));
            M(2,1) = sum(sum(Ih(i - offset : i+offset, j-offset : j+offset).*Iv(i - offset : i+offset, j-offset : j+offset)));
            M(2,2) = sum(sum(Iv(i - offset : i+offset, j-offset : j+offset).^2));

            
            % calculate R score for (i,j)
            R(i,j) = det(M) - (k * trace(M)^2);

        end
    end
end



%% Part C: Thresholding R scores (Provided to you, do not modify)
% Threshold standards is arbitrary, but for this assignment, I set the 
% value of the 1th percentile R as the threshold. So we only keep the
% largest 1% of the R scores (that are not -Inf) and their locations.
R_non_inf = R(~isinf(R));
top_R = sort(R_non_inf(:), 'descend');
R_threshold = top_R(round(length(top_R)*0.01));
R(R < R_threshold) = -Inf;

%% [15 pts] Part D: Non-maximum Suppression (Implement yourself)


% for each candidate keypoint
for row = 1 : height(R)
    for col = 1 : width(R)

        % if candidate keypoint is on border, set to supress
        if row == 1 || row >= height(R)
            R(row,col) = -Inf;
        elseif col == 1 || col >= width(R)-1
            R(row,col) = -Inf;
        % else if candidate keypoint's R score is less than or 
        % equal to ANY of its neighbors, surpress
        % candidate keypoint must be the largest among its
        % neighbors
        elseif any(R(row-1, col-1 : col+1) >= R(row,col)) || any(R(row+1, col-1 : col+1) >= R(row,col)) ...
               || any(R(row-1 : row+1, col-1) >= R(row,col)) || any(R(row-1 : row+1, col+1) >= R(row,col)) 
            R(row,col) = -Inf;
        end   
    end   
end


scores = zeros(0);
x = zeros(0);
y = zeros(0);

% for each pixel
for row = 1 : height(R)
    for col = 1 : width(R)
        
        % if pixel survived supression, save to variables
        if ~isinf(R(row,col))
            scores = [scores; R(row,col)];
            x = [x; col];
            y = [y; row];
        end
    end
end



