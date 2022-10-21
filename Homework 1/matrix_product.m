%--------------------------------------------------------------------------
% NAME       : Milan Bui
% INSTRUCTOR : Prof. Hwang
% COURSE     : CSI 4116.01
% DATE       : 23 September 2022
% ASSIGNMENT : Homework 1
% FILE       : matrix_product.m
%--------------------------------------------------------------------------

function [C] = matrix_product(A, B)
    C = zeros(height(A), width(B)); % product matrix A rows by B cols
    
    for rowA = 1 : height(A)
        row = zeros(1,width(B)); % each row of product

        for columnB = 1 : width(B)
            sum = 0;

            % multiplying each numbers in rowA in A to the numbers in
            % columnA in B to get the resulting row for the answer
            for columnA = 1 : width(A)
                product = A(rowA, columnA) * B(columnA, columnB);
                sum = sum + product;
            end

            
            row(columnB) = sum;

        end


        C(rowA,:) = row;

    end

end
