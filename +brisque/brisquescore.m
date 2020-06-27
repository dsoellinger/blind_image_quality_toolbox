function qualityscore  = brisquescore(imdist)

import brisque.*;

if(size(imdist,3)==3)
    imdist = uint8(imdist);
    imdist = rgb2gray(imdist);
end

imdist = double(imdist);

if(nargin<2)
feat = brisque_feature(imdist);
disp('feat computed')
end


%---------------------------------------------------------------------
%Quality Score Computation
%---------------------------------------------------------------------


fid = fopen('test_ind','w');

for jj = 1:size(feat,1)
    
fprintf(fid,'1 ');
for kk = 1:size(feat,2)
fprintf(fid,'%d:%f ',kk,feat(jj,kk));
end
fprintf(fid,'\n');
end

fclose(fid);
warning off all
delete output test_ind_scaled dump
system('svm-scale -r +brisque/allrange test_ind >> test_ind_scaled');
system('svm-predict -b 1 test_ind_scaled +brisque/allmodel output >>dump');

load output
qualityscore = output;

delete output test_ind_scaled dump test_ind
