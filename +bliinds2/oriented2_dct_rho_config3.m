function g2 = oriented2_dct_rho_config3(I)

%H=fspecial('gaussian',[7 7]);
temp=dct2(I);
eps=0.00000001;
%% 3x3
% temp2=[temp(2,2) temp(3,3)];

%% 7x7
% temp2=[temp(2,2) temp(3,3) temp(4,4) temp(5,5) temp(6,6) temp(7,7) temp(3,4) temp(4,3) temp(4,5) temp(5,4) temp(5,6) temp(6,5) temp(6,7) temp(7,6) temp(5,7) temp(7,5)];

%% 5x5
F = [0 0 0 0 0; 0 1 0 0 0; 0 0 1 1 0; 0 0 1 1 1; 0 0 0 1 1];
temp2=temp(F~=0);

%% 9x9
% temp2=[temp(2,2) temp(3,3) temp(4,4) temp(5,5) temp(6,6) temp(7,7) temp(8,8) temp(9,9) temp(3,4) temp(4,3) temp(4,5) temp(5,4) temp(5,6) temp(6,5) temp(6,7) temp(7,6) temp(5,7) temp(7,5) temp(6,8) temp(8,6) temp(7,8) temp(8,7) temp(7,9) temp(9,7) temp(8,9) temp(9,8)]; 


std_gauss=std(abs(temp2(:)));
mean_abs=mean(abs(temp2(:)));
g2=std_gauss/(mean_abs+0.0000001);

% g2=var(temp2)/(mean(temp2)+eps);