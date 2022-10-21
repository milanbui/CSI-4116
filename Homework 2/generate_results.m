%--------------------------------------------------------------------------
% NAME       : Milan Bui
% INSTRUCTOR : Prof. Hwang
% COURSE     : CSI 4116.01
% DATE       : 7 October 2022
% ASSIGNMENT : Homework 2
% FILE       : generate_results.m
%--------------------------------------------------------------------------
function contentAwareResize = generate_results(filename, reduceAmt, reduceWhat)

    contentAwareResize = imread(filename);

    % Reduce either height or width 'reduceAmt' number of times
    for i = 1 : reduceAmt

        if strcmp(reduceWhat, 'WIDTH')
            contentAwareResize = reduceWidth(contentAwareResize, false);
        elseif strcmp(reduceWhat, 'HEIGHT')
            contentAwareResize = reduceHeight(contentAwareResize, false);
        end

    end


end