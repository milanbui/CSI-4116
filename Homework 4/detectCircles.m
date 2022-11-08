% Finds and visualizes circles given an edge map
% output - centers an Nx2 matrix which each row lists the x,y position of a
% detected circle's center

% ignore circles whose centers are outside the image

% edges nx4 matrix 
% radius = size circle looking for
% top_k = # top scoring circle centers
%Since we use atand to compute gradient orientation in degrees, 
% make sure you use cosd and sind to detect circles.
%Use quantization_value = 5.
function [centers] = detectCircles(im, edges, radius, top_k)
    
    quantization_size = 5;
    limit = size(edges(:,1));
    centers = [];

    grey_im = rgb2gray(im);
    H = zeros(ceil(length(grey_im)/quantization_size), ceil(width(grey_im)/quantization_size));

    for row = 1 : limit
        a = edges(row,1) - (radius*cosd(edges(row,4)));
        b = edges(row,2) - (radius*sind(edges(row,4)));

        if (a <= length(im) && a >= 1 && b <= width(im) && b >= 1)
            aBinIndex = ceil(a/quantization_size);
            bBinIndex = ceil(b/quantization_size);
            H(aBinIndex, bBinIndex) = H(aBinIndex, bBinIndex) + 1;
        end
    end

    found = 0;
    centers = zeros(top_k, 2);
    while found < top_k
        [row, col] = find(ismember(H,max(H(:))));
        i = 1;
        
        while found < top_k && i <= length(row)
            centers(found+1, 1) = row(i)*quantization_size;
            centers(found+1, 2) = col(i)*quantization_size;
            i = i+1;
            found = found + 1;
        end


        if found < top_k
            for index = 1 : length(row)
                H(row(index), col(index)) = -1;
            end
        end

    end

    figure; 
    imshow(im); 
    viscircles(centers, radius * ones(size(centers, 1), 1));
end