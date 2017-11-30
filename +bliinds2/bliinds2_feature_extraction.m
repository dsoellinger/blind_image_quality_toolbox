function features = bliinds2_feature_extraction(I)

import bliinds2.*
    
h=fspecial('gaussian',3);

Img = double(I(:,:,1));

coeff_freq_var_L1 = blkproc(Img,[3,3],[1,1],@rho_dct);
gama_L1 = blkproc(Img,[3,3],[1,1],@gama_dct);
ori1_rho_L1 = blkproc(Img,[3 3],[1,1],@oriented1_dct_rho_config3);
ori2_rho_L1 = blkproc(Img,[3 3],[1,1],@oriented2_dct_rho_config3);
ori3_rho_L1 = blkproc(Img,[3 3],[1,1],@oriented3_dct_rho_config3);
subband_energy_L1 = blkproc(Img,[3 3],[1,1],@dct_freq_bands);

rho_sorted_temp = sort(coeff_freq_var_L1(:),'descend');
rho_count = length(rho_sorted_temp);
percentile10_coeff_freq_var_L1=mean(rho_sorted_temp(1:ceil(rho_count/10)));
percentile100_coeff_freq_var_L1=mean(rho_sorted_temp(:));
clear rho_sorted_temp rho_count

gama_sorted_temp = sort(gama_L1(:),'ascend');
gama_count = length(gama_sorted_temp);
percentile10_gama_L1=mean(gama_sorted_temp(1:ceil(gama_count/10)));
percentile100_gama_L1=mean(gama_sorted_temp(:));
clear gama_sorted_temp gama_count

subband_energy_sorted_temp = sort(subband_energy_L1(:),'descend');
subband_energy_count = length(subband_energy_sorted_temp);
percentile10_subband_energy_L1=mean(subband_energy_sorted_temp(1:ceil(subband_energy_count/10)));
percentile100_subband_energy_L1=mean(subband_energy_sorted_temp(:));
clear freq_bands_sorted_temp freq_bands_count

temp_size=size(ori1_rho_L1);
var_temp=zeros(temp_size);
    
for i=1:temp_size(1)
    for j=1:temp_size(2)
        var_temp(i,j)=var([ori1_rho_L1(i,j) ori2_rho_L1(i,j) ori3_rho_L1(i,j)]);
   end
end
ori_rho_L1=var_temp;

ori_sorted_temp = sort(ori_rho_L1(:),'descend');
ori_count = length(ori_sorted_temp);
percentile10_orientation_L1=mean(ori_sorted_temp(1:ceil(ori_count/10)));
percentile100_orientation_L1=mean(ori_sorted_temp(:));
clear var_ori_sorted_temp rho_count

features_L1 = [percentile100_coeff_freq_var_L1;percentile10_coeff_freq_var_L1;percentile100_gama_L1;percentile10_gama_L1;percentile100_subband_energy_L1;percentile10_subband_energy_L1;percentile100_orientation_L1;percentile10_orientation_L1];

%%

Img1_filtered=double(imfilter(Img,h));
Img2 = Img1_filtered(2:2:end,2:2:end);

coeff_freq_var_L2 = blkproc(Img2,[3,3],[1,1],@rho_dct);
gama_L2 = blkproc(Img2,[3,3],[1,1],@gama_dct);
ori1_rho_L2 = blkproc(Img2,[3 3],[1,1],@oriented1_dct_rho_config3);
ori2_rho_L2 = blkproc(Img2,[3 3],[1,1],@oriented2_dct_rho_config3);
ori3_rho_L2 = blkproc(Img2,[3 3],[1,1],@oriented3_dct_rho_config3);
subband_energy_L2 = blkproc(Img2,[3 3],[1,1],@dct_freq_bands);

rho_sorted_temp = sort(coeff_freq_var_L2(:),'descend');
rho_count = length(rho_sorted_temp);
percentile10_coeff_freq_var_L2=mean(rho_sorted_temp(1:ceil(rho_count/10)));
percentile100_coeff_freq_var_L2=mean(rho_sorted_temp(:));
clear rho_sorted_temp rho_count

gama_sorted_temp = sort(gama_L2(:),'ascend');
gama_count = length(gama_sorted_temp);
percentile10_gama_L2=mean(gama_sorted_temp(1:ceil(gama_count/10)));
percentile100_gama_L2=mean(gama_sorted_temp(:));
clear gama_sorted_temp gama_count

subband_energy_sorted_temp = sort(subband_energy_L2(:),'descend');
subband_energy_count = length(subband_energy_sorted_temp);
percentile10_subband_energy_L2=mean(subband_energy_sorted_temp(1:ceil(subband_energy_count/10)));
percentile100_subband_energy_L2=mean(subband_energy_sorted_temp(:));
clear freq_bands_sorted_temp freq_bands_count

temp_size=size(ori1_rho_L2);
var_temp=zeros(temp_size);
    
for i=1:temp_size(1)
    for j=1:temp_size(2)
        var_temp(i,j)=var([ori1_rho_L2(i,j) ori2_rho_L2(i,j) ori3_rho_L2(i,j)]);
   end
end
ori_rho_L2=var_temp;

ori_sorted_temp = sort(ori_rho_L2(:),'descend');
ori_count = length(ori_sorted_temp);
percentile10_orientation_L2=mean(ori_sorted_temp(1:ceil(ori_count/10)));
percentile100_orientation_L2=mean(ori_sorted_temp(:));
clear var_ori_sorted_temp rho_count

features_L2 = [percentile100_coeff_freq_var_L2;percentile10_coeff_freq_var_L2;percentile100_gama_L2;percentile10_gama_L2;percentile100_subband_energy_L2;percentile10_subband_energy_L2;percentile100_orientation_L2;percentile10_orientation_L2];

%%
Img2_filtered=double(imfilter(Img2,h));
Img3 = Img2_filtered(2:2:end,2:2:end);
       
coeff_freq_var_L3 = blkproc(Img3,[3,3],[1,1],@rho_dct);
gama_L3 = blkproc(Img3,[3,3],[1,1],@gama_dct);
ori1_rho_L3 = blkproc(Img3,[3 3],[1,1],@oriented1_dct_rho_config3);
ori2_rho_L3 = blkproc(Img3,[3 3],[1,1],@oriented2_dct_rho_config3);
ori3_rho_L3 = blkproc(Img3,[3 3],[1,1],@oriented3_dct_rho_config3);
subband_energy_L3 = blkproc(Img3,[3 3],[1,1],@dct_freq_bands);

rho_sorted_temp = sort(coeff_freq_var_L3(:),'descend');
rho_count = length(rho_sorted_temp);
percentile10_coeff_freq_var_L3=mean(rho_sorted_temp(1:ceil(rho_count/10)));
percentile100_coeff_freq_var_L3=mean(rho_sorted_temp(:));
clear rho_sorted_temp rho_count

gama_sorted_temp = sort(gama_L3(:),'ascend');
gama_count = length(gama_sorted_temp);
percentile10_gama_L3=mean(gama_sorted_temp(1:ceil(gama_count/10)));
percentile100_gama_L3=mean(gama_sorted_temp(:));
clear gama_sorted_temp gama_count

subband_energy_sorted_temp = sort(subband_energy_L3(:),'descend');
subband_energy_count = length(subband_energy_sorted_temp);
percentile10_subband_energy_L3=mean(subband_energy_sorted_temp(1:ceil(subband_energy_count/10)));
percentile100_subband_energy_L3=mean(subband_energy_sorted_temp(:));
clear freq_bands_sorted_temp freq_bands_count

temp_size=size(ori1_rho_L3);
var_temp=zeros(temp_size);
    
for i=1:temp_size(1)
    for j=1:temp_size(2)
        var_temp(i,j)=var([ori1_rho_L3(i,j) ori2_rho_L3(i,j) ori3_rho_L3(i,j)]);
   end
end
ori_rho_L3=var_temp;

ori_sorted_temp = sort(ori_rho_L3(:),'descend');
ori_count = length(ori_sorted_temp);
percentile10_orientation_L3=mean(ori_sorted_temp(1:ceil(ori_count/10)));
percentile100_orientation_L3=mean(ori_sorted_temp(:));
clear var_ori_sorted_temp rho_count

features_L3 = [percentile100_coeff_freq_var_L3;percentile10_coeff_freq_var_L3;percentile100_gama_L3;percentile10_gama_L3;percentile100_subband_energy_L3;percentile10_subband_energy_L3;percentile100_orientation_L3;percentile10_orientation_L3];

%%
features = [features_L1' features_L2' features_L3'];