DIIVINE Software release.


========================================================================

-----------COPYRIGHT NOTICE STARTS WITH THIS LINE------------
Copyright (c) 2010 The University of Texas at Austin
All rights reserved.

Permission is hereby granted, without written agreement and without license or royalty fees, to use, copy, 
modify, and distribute this code (the source files) and its documentation for
any purpose, provided that the copyright notice in its entirety appear in all copies of this code, and the 
original source of this code, Laboratory for Image and Video Engineering (LIVE, http://live.ece.utexas.edu)
and Center for Perceptual Systems (CPS, http://www.cps.utexas.edu) at the University of Texas at Austin (UT Austin, 
http://www.utexas.edu), is acknowledged in any publication that reports research using this code. The research
is to be cited in the bibliography as:

1. A. K. Moorthy and A. C. Bovik, "Blind Image Quality Assessment: From Natural
Scene Statistics to Perceptual Quality", IEEE Transactions on Image Processing, to appear (2011).

2. A. K. Moorthy and A. C. Bovik, "DIVINE Software Release", 
URL: http://live.ece.utexas.edu/research/quality/DIIVINE_release.zip, 2010

IN NO EVENT SHALL THE UNIVERSITY OF TEXAS AT AUSTIN BE LIABLE TO ANY PARTY FOR DIRECT, INDIRECT, SPECIAL, INCIDENTAL, 
OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OF THIS DATABASE AND ITS DOCUMENTATION, EVEN IF THE UNIVERSITY OF TEXAS
AT AUSTIN HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

THE UNIVERSITY OF TEXAS AT AUSTIN SPECIFICALLY DISCLAIMS ANY WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED 
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE DATABASE PROVIDED HEREUNDER IS ON AN "AS IS" BASIS,
AND THE UNIVERSITY OF TEXAS AT AUSTIN HAS NO OBLIGATION TO PROVIDE MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS.

-----------COPYRIGHT NOTICE ENDS WITH THIS LINE------------%

Author  : Anush Krishna Moorthy
Version : 1.1

The authors are with the Laboratory for Image and Video Engineering
(LIVE), Department of Electrical and Computer Engineering, The
University of Texas at Austin, Austin, TX.

Kindly report any suggestions or corrections to anushmoorthy@gmail.com

========================================================================

This is a demonstration of the Distortion Identification based image Verity and INtegrity Evaluation (DIVINE) index.
It is an implementation of the BIQI in the reference.
The algorithm is described in:
A. K. Moorthy and A. C. Bovik, "Blind Image Quality Assessment: From Natural
Scene Statistics to Perceptual Quality",  IEEE Transactions on Image Processing, to appear (2011).

You can change this program as you like and use it anywhere, but please
refer to its original source (cite our paper and our web page at
http://live.ece.utexas.edu/research/quality/DIIVINE_release.zip).

Input : A test 8bits/pixel grayscale image loaded in a 2-D array
Output: A quality score of the image. The score typically has a value
       between 0 and 100 (0 represents the best quality, 100 the worst).

Usage:

1. Load the image, for example

  image = rgb2gray(imread('testimage.jpg')); 

2. Call this function to calculate the quality score:

   quality = divine(image)

Dependencies: 
Steerable Pyramid Toolbox, Download from: http://www.cns.nyu.edu/~eero/steerpyr/
LibSVM package for MATLAB, Download from: http://www.csie.ntu.edu.tw/~cjlin/libsvm/
You may need the MATLAB Image Processing Toolbox

Dependencies--

MATLAB files:  ssim_index_new.m, norm_sender_normalized.m, find_spatial_hist_fast.m, divine_overall_quality.m
              divine_feature_extract.m,  map_matrix_to_closest_vec.m (provided with release)

Data files: data_live_trained.mat (provided with release)

This code has been tested on Windows and Mac OSX (Snow Leopard)

========================================================================

Note on training: 
This release version of BIQI was trained on the entire LIVE database.
