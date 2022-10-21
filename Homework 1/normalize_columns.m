%--------------------------------------------------------------------------
% NAME       : Milan Bui
% INSTRUCTOR : Prof. Hwang
% COURSE     : CSI 4116.01
% DATE       : 23 September 2022
% ASSIGNMENT : Homework 1
% FILE       : normalize_columns.m
%--------------------------------------------------------------------------


function [B] = normalize_columns(A)

    B = (normalize(A,'norm',1));

end