function g1 = oriented1_dct_rho_config3(I)

%H=fspecial('gaussian',[7 7]);

temp=dct2(I);
eps=0.00000001;
%% 3x3
% temp1=[temp(1,3) temp(2,3)];


%% 7x7
% temp1=[temp(1,2:end) temp(2,3:end) temp(3,5:end) temp(4,6:end)];


%% 5x5

F = [0 1 1 1 1;0 0 1 1 1; 0 0 0 0 1; 0 0 0 0 0;0 0 0 0 0];
temp1=temp(F~=0);

%% 9x9
% temp1=[temp(1,2:end) temp(2,3:end) temp(3,5:end) temp(4,6:end) temp(5,8:end) temp(6,9:end)];

std_gauss=std(abs(temp1(:)));
mean_abs=mean(abs(temp1(:)));
g1=std_gauss/(mean_abs+0.0000001);

% g1=var(temp1)/mean(temp1);
