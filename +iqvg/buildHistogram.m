function [fv] = buildHistogram (bags, numInstances, p)
	
	p_p = 1/p;
	matrix = eye(p);
	
	fv = zeros( size(bags, 1)/numInstances, p*size(bags,2));
	for ii = 1 : size (fv,1)
		st = (ii-1)*numInstances+1;
		ed = ii * numInstances;
		each_fv = bags(st:ed,:);
		each_fv(any(isnan(each_fv)'),:) = [];
		
		fv_bag = zeros(size(each_fv, 1), p*size(each_fv,2));
		for jj = 1 : size(each_fv, 1)
			
			line = each_fv(jj,:);
			f = zeros(1, p*size(line,2));
			for kk = 1 : size(line,2)
				st = (kk-1)*p+1;
				ed = kk*p;
				
				n = fix(line(1,kk)/p_p)+1;
                
				f(1, st:ed) = matrix(n,:);		
			end
			
			fv_bag(jj,:) = f;
			
		end
		
		fv_bag = sum(fv_bag);
		fv(ii,:) = fv_bag;
	end
	
return;