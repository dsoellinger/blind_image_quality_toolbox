function [] = outSVMData(f)
    fid = fopen('f.txt', 'w');
	for ii = 1 : size (f, 1)
	    fprintf (fid, '%f ', -1);
	    for jj = 1 : size (f, 2)
		    fprintf (fid, '%d:', jj);
		    fprintf (fid, '%f ', f(ii, jj));
		end
		fprintf (fid, '\n');
	end
	fclose (fid);
return;