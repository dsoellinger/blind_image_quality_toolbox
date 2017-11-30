function [ score ] = IQVG(img)

    import iqvg.*;
    
	patchSize = 7;
	maxFrequency = 1;
	frequencyNum = 5;
	orientionsNum = 4; 
	patchNum = 5000; %more patches, more stable the result is
	gfFeature = sample_img(img, patchSize, maxFrequency, frequencyNum, orientionsNum, patchNum);
	% 200 is the number of bins that we use to encode the Gabor feature.
	imgPre = buildHistogram (gfFeature, patchNum, 200);
	outSVMData(imgPre);
	% conducted this in the cmd console
	%svm-scale.exe -r scale_parameter f.txt > f_scaled.txt
    system('/usr/local/Cellar/libsvm/3.22/bin/svm-scale -r +iqvg/scale_parameter f.txt > f_scaled.txt');
	[~, f_scaled] = libsvmread('f_scaled.txt');
	load('+iqvg/model.mat');
	[predict_label, accuracy, dec_values] = svmpredict(-1, f_scaled, model, '-b 0');
	score = predict_label;
    
    delete 'f.txt';
    delete 'f_scaled.txt';
end

