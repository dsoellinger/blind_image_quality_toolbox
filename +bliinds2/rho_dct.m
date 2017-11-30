function g = rho_dct(I)

import bliinds2.*;

temp1=dct2(I);
temp2=temp1(:);
temp3=temp2(2:end);

%g=kurtosis(temp3);
g= rho_gen_gauss(temp3);