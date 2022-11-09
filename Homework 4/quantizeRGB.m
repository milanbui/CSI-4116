%--------------------------------------------------------------------------
% NAME       : Milan Bui
% INSTRUCTOR : Prof. Hwang
% COURSE     : CSI 4116.01
% DATE       : 11 November 2022
% ASSIGNMENT : Homework 4
% FILE       : quantizeRGB.m
% DESCRIPTION: Quantize a color space by applying k-means clustering to the
%              pixels. Replaces the RGB value at each pixel with the 
%              average Rgb value in the cluster to which that pixel belongs 
%              (mapping each pizel in the input image to its nearest k-means 
%              center). The RGB values are treated jointly as the 3D 
%              representation of the pixel. Use kmeans.
%              
%              INPUTS:
%              origImg - RGB image of class uint8
%              k       - number of colors to quantize to (num of clusters)
%
%              OUTPUTS:
%              outputImg   - RGB image of class uint8, quantized
%              meanColors  - kx3 array of k centers (one val for each
%                            cluster and each clor channel)
%              clustersIds - numpixelsx1 matrix (with numpixels =
%                            numrows*numcolumns) that says to which cluster 
%                            each pixel belongs
%--------------------------------------------------------------------------
function [outputImg, meanColors, clusterIds] = quantizeRGB(origImg, k)
% NOTES
% If the variable origImg is a 3d matrix (numrowsxnumcolsx3) containing a 
% color image with numpixels pixels (first two dimensions) in each color 
% channel (third dimension), then X = reshape(origImg, [numpixels, 3]); 
% will yield a matrix with the RGB features as its rows. It is in this 
% space (samples = rows, features = columns) that you want to apply k-means.

% Be careful with the variable types. kmeans takes double. imshow needs 
% either (i) an image of type uint8 or (ii) a double image with rescaled 
% intensities between 0 and 1 (e.g., divide all intensities by 255).

% You may get a warning Warning: Failed to converge in 100 iterations. Do 
% not worry about it. This just warns you that the kmeans could still be 
% improved slightly if we let it run for longer by increasing MaxIter which
% the default is 100.


end