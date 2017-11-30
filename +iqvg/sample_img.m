%gabor_feature = sample_img (img, 7, 1, 5, 4, 5000);
function [gf_feature, sal_feature] = sample_img( img, patchSize, maxFrequency, frequencyNum, orientionsNum, patchNum)
    
    import iqvg.*;
    
	if size(img,3)~=1
		oriMap = 0.299 * double(img(:,:,1)) + 0.587 * double(img(:,:,2)) + 0.114 * double(img(:,:,3));
	end
	
	fixedPatchNum = 5000;
	
	saliencyMap = double(SDSP(img));
	saliencyMap = saliencyMap./ max(saliencyMap(:));
	salMap_patches = im2col(saliencyMap, [patchSize,patchSize]);
	J = randperm(size(salMap_patches,2));
	salMap_patches = double(salMap_patches(:,J(1:min(fixedPatchNum,length(J)))));
	sal_feature = mean (salMap_patches);
	sal_feature = sal_feature';
	oriMap_patches = im2col(oriMap,[patchSize,patchSize]);
	oriMap_patches = double(oriMap_patches(:,J(1:min(fixedPatchNum,length(J)))));
	
	[sal_value, index] = sort(sal_feature, 'descend');
	
    fv = zeros(patchNum, 2*frequencyNum*orientionsNum);
	
	for ii = 1 : patchNum
		oriMap_patch = oriMap_patches(:, index(ii, 1));
		oriMap_patch = reshape(oriMap_patch, patchSize, patchSize);
		gabor_fv = fun_gabor_fv( oriMap_patch, maxFrequency, frequencyNum, orientionsNum );
		fv(ii,:) = gabor_fv;
	end;	
	gf_feature = fv;
return;












