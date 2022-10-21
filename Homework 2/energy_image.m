%--------------------------------------------------------------------------
% NAME       : Milan Bui
% INSTRUCTOR : Prof. Hwang
% COURSE     : CSI 4116.01
% DATE       : 7 October 2022
% ASSIGNMENT : Homework 2
% FILE       : energy_image.m
%--------------------------------------------------------------------------
function [energyImage, Ix, Iy] = energy_image(im, Ix_kernel, Iy_kernel)
    
    grey_im = rgb2gray(im);
    grey_im = double(grey_im);


    % Calculate the gradients/derivatives/change of image intesnsity
    Ix = imfilter(grey_im, Ix_kernel);
    Iy = imfilter(grey_im, Iy_kernel);

    % Calculate L2 Norm
    energyImage = sqrt( Ix(:,:).^2 + Iy(:,:).^2 );


end