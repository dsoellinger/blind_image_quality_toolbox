function [score B A Z] = jpeg_quality_score(img)

%========================================================================
%
%Copyright (c) 2002 The University of Texas at Austin
%All Rights Reserved.
% 
%This program is free software; you can redistribute it and/or modify
%it under the terms of the GNU General Public License as published by
%the Free Software Foundation; either version 2 of the License, or
%(at your option) any later version.
% 
%This program is distributed in the hope that it will be useful,
%but WITHOUT ANY WARRANTY; without even the implied warranty of
%MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%GNU General Public License for more details.
% 
%The GNU Public License is available in the file LICENSE, or you
%can write to the Free Software Foundation, Inc., 59 Temple Place -
%Suite 330, Boston, MA 02111-1307, USA, or you can find it on the
%World Wide Web at http://www.fsf.org.
%
% Author  : Zhou Wang 
% Version : 1.0
% Modified: Anush Krishna Moorthy
% Version: 1.BUQI
% 
%The authors are with the Laboratory for Image and Video Engineering
%(LIVE), Department of Electrical and Computer Engineering, The
%University of Texas at Austin, Austin, TX.
%
%Kindly report any suggestions or corrections to zhouwang@ieee.org
%
%========================================================================
%
%This is an implementation of the algorithm for calculating the quality
%score of JPEG compressed images proposed by Zhou Wang, Hamid R. Sheikh
%and Alan C. Bovik. Please refer to the paper: Zhou Wang, Hamid R. Sheikh
%and Alan C. Bovik, "No-Reference Perceptual Quality Assessment of JPEG
%Compressed Images," submitted to IEEE International Conference on Image
%Processing, Sept. 2002.
%
%You can change this program as you like and use it anywhere, but please
%refer to its original source (cite our paper and our web page at
%http://anchovy.ece.utexas.edu/~zwang/research/nr_jpeg_quality/index.html).
%
%Input : A test 8bits/pixel grayscale image loaded in a 2-D array
%Output: A quality score of the image. The score typically has a value
%        between 1 and 10 (10 represents the best quality, 1 the worst).
%
%Usage:
%
%1. Load the image, for example
%
%   image = imread('testimage.jpg'); 
%
%2. Call this function to calculate the quality score:
%
%   Quality_Score = jpeg_quality_score(image)
%
%========================================================================

if (nargin > 1)
    score = -1;
    return;
end

[M N] = size(img);
if (M < 16 | N < 16)
    score = -2;
    return;
end
   
x = double(img);

% Feature Extraction:

% 1. horizontal features

d_h = x(:, 2:N) - x(:, 1:(N-1));

B_h = mean2(abs(d_h(:, 8:8:8*(floor(N/8)-1))));

A_h = (8*mean2(abs(d_h)) - B_h)/7;

sig_h = sign(d_h);
left_sig = sig_h(:, 1:(N-2));
right_sig = sig_h(:, 2:(N-1));
Z_h = mean2((left_sig.*right_sig)<0);

% 2. vertical features

d_v = x(2:M, :) - x(1:(M-1), :);

B_v = mean2(abs(d_v(8:8:8*(floor(M/8)-1), :)));

A_v = (8*mean2(abs(d_v)) - B_v)/7;

sig_v = sign(d_v);
up_sig = sig_v(1:(M-2), :);
down_sig = sig_v(2:(M-1), :);
Z_v = mean2((up_sig.*down_sig)<0);

% 3. combined features

B = (B_h + B_v)/2;
A = (A_h + A_v)/2;
Z = (Z_h + Z_v)/2;

% Quality Prediction

alpha = -927.4240; beta =  850.8986;gamma1 =235.4451 ;gamma2 = 128.7548;gamma3 =-341.4790;
score = alpha + beta*(B.^(gamma1/10000))*(A.^(gamma2/10000))*(Z.^(gamma3/10000));
