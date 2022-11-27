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
