%--------------------------------------------------------------------------
% NAME       : Milan Bui
% INSTRUCTOR : Prof. Hwang
% COURSE     : CSI 4116.01
% DATE       : 23 September 2022
% ASSIGNMENT : Homework 1
% FILE       : fib.m
%--------------------------------------------------------------------------

function [val] = fib(n)

    if n > 0

        nminus1 = 0;
        nminus2 = 1;
    
        for i = 1 : n

            val = nminus1 + nminus2;

            nminus2 = nminus1;
            nminus1 = val;

        end

        
    end


end