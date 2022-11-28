%--------------------------------------------------------------------------
% NAME       : Milan Bui
% INSTRUCTOR : Prof. Hwang
% COURSE     : CSI 4116.01
% DATE       : 30 November 2022
% ASSIGNMENT : Homework 5
% FILE       : apply_homogrophy.m
% DESCRIPTION: Applies the homography and converts back from homogeneous
%              coordinates (ie. [wx' wy' w'] to [x' y'])
%              
%              INPUTS:
%              p1 - 1x2 vector (ie. [x,y]) in image 1 space
%              H - the homography matrix from problem 1
%
%              OUTPUTS:
%              p2 - 1x2 vector (ie. [x,y]) in image 2 space. In other words
%                   p1 in image 1 should transform to p2 in image 2
%--------------------------------------------------------------------------
function [p2] = apply_homography(p1, H)

    newP1 = [p1, 1];  % add 1 to vectr to perform operation [x,y,1]

    % perform p' = H*p
    p2_homogeneous = H*newP1';

    % Convert from homogeneous to image coordinates 
    x = p2_homogeneous(1, 1) / p2_homogeneous(3, 1);  % x = x' / w
    y = p2_homogeneous(2, 1) / p2_homogeneous(3, 1);  % y = y' / w

    p2 = [x,y];

end