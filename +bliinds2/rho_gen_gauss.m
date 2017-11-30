function rho =rho_gen_gauss(I)
%% we know this one works well 
% mean_gauss=mean(I(:));
% var_gauss=var(I(:));
% mean_abs=mean(abs(I(:)-mean_gauss))^2;
% rho=var_gauss/(mean_abs+0.0000001);

%% let's see how well this one does

% mean_gauss=mean(I(:));
% std_gauss=std(abs(I(:)));
% mean_abs=mean(abs(I(:)-mean_gauss));
% rho=std_gauss/(mean_abs+0.0000001);

%% Third thing to test

std_gauss=std(abs(I(:)));
mean_abs=mean(abs(I(:)));
rho=std_gauss/(mean_abs+0.0000001);
