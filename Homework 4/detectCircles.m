%--------------------------------------------------------------------------
% NAME       : Milan Bui
% INSTRUCTOR : Prof. Hwang
% COURSE     : CSI 4116.01
% DATE       : 11 November 2022
% ASSIGNMENT : Homework 4
% FILE       : detectCircles.m
% DESCRIPTION: Finds circles in an image using hough transform. Uses a
%              a quantization value (bin size) of 5. Because atand is used
%              to compute the gradient orientation, uses cosd and sind.
%              
%              INPUTS:
%              im     - RGB image of class uint8
%              edges  - nx4 matrix containing 4 numbers for each detected 
%                       edge point. 
%                       N(i,1) = x location
%                       N(i,2) = y location 
%                       N(i,3) = gradient magnitute 
%                       N(i,4) = gradient orientation (non-quantized)
%              radius - size of circle to look for
%              top_k  - the number of top-scoring circle center
%                       possibilities to display
%
%              OUTPUTS:
%              centers - an nx2 matrix containing the detected circle
%                        centers (i,1) = x, (i,2) = y
%--------------------------------------------------------------------------
function [centers] = detectCircles(im, edges, radius, top_k)
    
    % Initialize variables
    quantization_size = 5;
    centers = zeros(top_k, 2);

    % Initialize hough space to 0
    grey_im = rgb2gray(im);
    H = zeros(ceil(length(grey_im)/quantization_size), ceil(width(grey_im)/quantization_size));

    % for each edge point
    for row = 1 : size(edges(:,1))
        % calculate a and b (possible circle centers)
        a = edges(row,1) - (radius*cosd(edges(row,4)));
        b = edges(row,2) - (radius*sind(edges(row,4)));

        % if a and b are within range (within borders of image)
        if (a <= length(im) && a >= 1 && b <= width(im) && b >= 1)

            % Calculate indeces of a and b in hough space
            aBinIndex = ceil(a/quantization_size);
            bBinIndex = ceil(b/quantization_size);

            % Increment location of circle center in hough space
            H(aBinIndex, bBinIndex) = H(aBinIndex, bBinIndex) + 1;
        end

    end % end for loop ( for each edge point)

    found = 0;  % found top centers

    % while number of detected circles is less than top_k
    while found < top_k

        % find the rows and columns (a's & b's) of the top scoring
        % location(s) in hough space
        [row, col] = find(ismember(H,max(H(:))));

        i = 1;  % index to increment through found rows

        % while the found centers are less than top_k and the index is less
        % than the size of the array of found centers
        while found < top_k && i <= length(row)

            % find x and y location from a and b
            centers(found+1, 1) = row(i)*quantization_size;
            centers(found+1, 2) = col(i)*quantization_size;

            % increment variables
            i = i+1;
            found = found + 1;
        end


        % if found is still less than top_k
        if found < top_k

            % for each location found, set value to -1 to mark it as 
            % already found (so we can find the next top-scoring bin)
            for index = 1 : length(row)
                H(row(index), col(index)) = -1;
            end
        end

    end % end while loop (while found < top_k)

    % Display circles on figure
    figure; 
    imshow(im); 
    viscircles(centers, radius * ones(size(centers, 1), 1));
end