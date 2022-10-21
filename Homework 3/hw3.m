%--------------------------------------------------------------------------
% NAME       : Milan Bui
% INSTRUCTOR : Prof. Hwang
% COURSE     : CSI 4116.01
% DATE       : 21 October 2022
% ASSIGNMENT : Homework 3
% FILE       : hw3.m
%--------------------------------------------------------------------------

%% Change the filename to use your own image
image = imread('building.jpg');
[x, y, scores, Ih, Iv] = extract_keypoints(image);

%% Part e to produce cardinal_harris.png and my_image_harris.png
% Some of your images may need different circle_size_modifier. Change this
% to other values as needed when testing out your images.
circle_size_modifier = 250000000000;

% cardinal - 100000000000
% building - 250000000000

imshow(image); hold on;
for i=1:length(scores)
    plot(x(i), y(i), 'g.'); 
    circle_size = abs(scores(i)) / circle_size_modifier;
    % Some scores may be <0, so we take the abs.
    plot(x(i), y(i), 'ro', 'MarkerSize', circle_size); 
end
hold off;

%% Saving the figure
% Change the output filenames to my_image_harris.png as needed

% This saves what is shown on the figure window. Thus, you may want to
% slighly resize the figure window such that the circles have reasonable
% sizes. If you want to resize the figure window then save the figure, 
% simply call the following command AFTER you resize the window.
saveas(gcf, 'my_image_harris.png');