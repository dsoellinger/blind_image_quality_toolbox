function g3 = oriented3_dct_rho_config3(I)

%H=fspecial('gaussian',[7 7]);

eps=0.00000001;
temp=dct2(I);

%% 3x3
% temp3=[temp(2,1) temp(3,1) temp(3,2)];

%% 7x7
% temp3=[temp(2:end,1)' temp(3:end,2)' temp(5:end,3)' temp(6:end,4)'];

%% 5x5
F = [0 1 1 1 1;0 0 1 1 1; 0 0 0 0 1; 0 0 0 0 0;0 0 0 0 0]';
temp3=temp(F~=0);

%% 9x9
% temp3=[temp(2:end,1)' temp(3:end,2)' temp(5:end,3)' temp(6:end,4)' temp(8:end,5)' temp(9:end,6)'];

std_gauss=std(abs(temp3(:)));
mean_abs=mean(abs(temp3(:)));
g3=std_gauss/(mean_abs+0.0000001);

% g3=var(temp3)/mean(temp3);