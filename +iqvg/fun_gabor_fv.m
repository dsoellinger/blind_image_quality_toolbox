function fv = fun_gabor_fv(patch, maxFrequency, frequencyNum, orientionsNum)
	
    minI = min(patch(:));
    maxI = max(patch(:));
	if abs(maxI-minI)>1e-4,
		a = 1/(maxI-minI);
		b = -a*minI;
		patch = a*patch+b;
	else
		patch = patch/maxI;
	end
	
	bank=sg_createfilterbank(size(patch), maxFrequency , frequencyNum, orientionsNum);
	r=sg_filterwithbank(patch,bank);
	gMx=sg_resp2samplematrix(r);
	gMx = sg_normalizesamplematrix(gMx); 
	
	gfv = zeros(frequencyNum*orientionsNum*2,1);
	gMx = abs(gMx);
	gfv(1:frequencyNum * orientionsNum) = mean(mean(gMx)); % mean
    [N1,N2] = size(patch);
	gMx = reshape(gMx, N1 * N2, frequencyNum * orientionsNum); 
    gfv( frequencyNum * orientionsNum + 1 : end) = std(gMx)';  % standard variation
	fv = gfv;
return;