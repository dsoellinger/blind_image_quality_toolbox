RISQUEE Software release.


========================================================================

-----------COPYRIGHT NOTICE STARTS WITH THIS LINE------------
Copyright (c) 2011 The University of Texas at Austin
All rights reserved.

Permission is hereby granted, without written agreement and without license or royalty fees, to use, copy, 
modify, and distribute this code (the source files) and its documentation for
any purpose, provided that the copyright notice in its entirety appear in all copies of this code, and the 
original source of this code, Laboratory for Image and Video Engineering (LIVE, http://live.ece.utexas.edu)
and Center for Perceptual Systems (CPS, http://www.cps.utexas.edu) at the University of Texas at Austin (UT Austin, 
http://www.utexas.edu), is acknowledged in any publication that reports research using this code. The research
is to be cited in the bibliography as:

1) A. Mittal, A. K. Moorthy and A. C. Bovik, "BRISQUE Software Release", 
URL: http://live.ece.utexas.edu/research/quality/BRISQUE_release.zip, 2011

2) A. Mittal, A. K. Moorthy and A. C. Bovik, "No Reference Image Quality Assessment in the Spatial Domain"
submitted

IN NO EVENT SHALL THE UNIVERSITY OF TEXAS AT AUSTIN BE LIABLE TO ANY PARTY FOR DIRECT, INDIRECT, SPECIAL, INCIDENTAL, 
OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OF THIS DATABASE AND ITS DOCUMENTATION, EVEN IF THE UNIVERSITY OF TEXAS
AT AUSTIN HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

THE UNIVERSITY OF TEXAS AT AUSTIN SPECIFICALLY DISCLAIMS ANY WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED 
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE DATABASE PROVIDED HEREUNDER IS ON AN "AS IS" BASIS,
AND THE UNIVERSITY OF TEXAS AT AUSTIN HAS NO OBLIGATION TO PROVIDE MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS.

-----------COPYRIGHT NOTICE ENDS WITH THIS LINE------------%

Author  : Anish Mittal 
Version : 1.0

The authors are with the Laboratory for Image and Video Engineering
(LIVE), Department of Electrical and Computer Engineering, The
University of Texas at Austin, Austin, TX.

Kindly report any suggestions or corrections to mittal.anish@gmail.com

========================================================================

This is a demonstration of the Blind/Referenceless Image Spatial Quality Evaluator (BRISQUE) index.
The algorithm is described in:

A. Mittal, A. K. Moorthy and A. C. Bovik, "No Reference Image Quality Assessment in the Spatial Domain"


You can change this program as you like and use it anywhere, but please
refer to its original source (cite our paper and our web page at
http://live.ece.utexas.edu/research/quality/BRISQUE_release.zip).

========================================================================

Running on Matlab 


Input : A test image loaded in an array

Output: A quality score of the image. The score typically has a value
           between 0 and 100 (0 represents the best quality, 100 the worst).
  
Usage:

1. Load the image, for example

  image         = imread('testimage1.bmp'); 

2. Call this function to calculate the quality score:

   qualityscore = brisquescore(image)

Dependencies: 

Binaries: svm-predict, svm-scale (from LibSVM) - provided with release
MATLAB files: brisquescore.m, estimateggdparam.m, estimateaggdparam.m, brisque_feature.m (provided with release)

Data files: range_all, model_all (provided with release)

Image Files: testimage1.bmp, testimage2.bmp

NOTE: Please rename the .exe1 files to .exe files -- this code will work only on WINDOWS systems.

========================================================================

Note on training: 
This release version of BRISQUE was trained on the entire LIVE database.


This program uses LibSVM binaries.
Below is the requried copyright notice for the binaries distributed with this release.

====================================================================
LibSVM tools: svm-predict, svm-scale (binaries)
--------------------------------------------------------------------

If you want to run this on a Linux distribution, you could change the lines 

system('svm-scale -r allrange test_ind >> test_ind_scaled');
system('svm-predict -b 1 test_ind_scaled allmodel output >>dump');

to 

system('wine svm-scale -r allrange test_ind >> test_ind_scaled');
system('wine svm-predict -b 1 test_ind_scaled allmodel output >>dump');

Ofcourse, this now requires "wine" to be installed. 

Copyright (c) 2000-2009 Chih-Chung Chang and Chih-Jen Lin
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions
are met:

1. Redistributions of source code must retain the above copyright
notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright
notice, this list of conditions and the following disclaimer in the
documentation and/or other materials provided with the distribution.

3. Neither name of copyright holders nor the names of its contributors
may be used to endorse or promote products derived from this software
without specific prior written permission.


THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR
CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
====================================================================