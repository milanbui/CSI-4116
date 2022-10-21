%--------------------------------------------------------------------------
% NAME       : Milan Bui
% INSTRUCTOR : Prof. Hwang
% COURSE     : CSI 4116.01
% DATE       : 23 September 2022
% ASSIGNMENT : Homework 1
% FILE       : my_unique.m
%--------------------------------------------------------------------------

function [N] = my_unique(M)

    N = M(1,:);

    % Adding rows from M to N
    for checkRow = 1 : height(M)

        % Row to add from M
        currentRow = M(checkRow,:);
        isDuplicate = false;

        % Checks if current row is already in N
        for row = 1 : height(N)

            isSame = true;

            % checks each number in the current row in N
            for number = 1 : width(N)

                if not(currentRow(number) == N(row,number))
    
                    isSame = false;
    
                end


            end


            % if all elements match in the row, there is a duplicate
            if isSame 

                isDuplicate = true;
            
            end
        

        end


        % if not duplicates found, add to N
        if not(isDuplicate)
            N = [N; currentRow];
        end


    end
    
end