IQVG Version 1.0
Copyright(c) 2014 Zhongyi Gu, Lin Zhang, and Hongyu Li
All Rights Reserved.

----------------------------------------------------------------------
 Permission to use, copy, or modify this software and its documentation
 for educational and research purposes only and without fee is here
 granted, provided that this copyright notice and the original authors'
 names appear on all copies and supporting documentation. This program
 shall not be used, rewritten, or adapted as the basis of a commercial
 software or hardware product without first obtaining permission of the
 authors. The authors make no representations about the suitability of
 this software for any purpose. It is provided "as is" without express
 or implied warranty.
----------------------------------------------------------------------

Please refer to the following paper

Zhongyi Gu, Lin Zhang*, and Hongyu Li, Learning a blind image quality index based on visual saliency guided sampling and Gabor filtering, in: Proc. ICIP, 2013  
 
----------------------------------------------------------------------

Input : 
the name of the image

Output: 
the prediction of the quality of the image

Dependency
Gabor filter toolbox: 
http://www2.it.lut.fi/project/simplegabor/
LibSVM
http://www.csie.ntu.edu.tw/~cjlin/libsvm/

Usage:
score = IQVG( 'img1.bmp');











