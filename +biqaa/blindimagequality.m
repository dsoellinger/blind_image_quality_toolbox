function [Qg,Qch]=blindimagequality(X,N,nod,firstangle,angleunits)
%%
%[Qg,Qch]=blindimagequality(X,N,nod,firstangle,angleunits)
% Blind Image quality assessment through anisotropy (BIQAA). 
% Details can be found in: S. Gabarda and G. Cristóbal, “Blind Image 
% quality assessment through anisotropy”, Journal of the Optical Society 
% of America, Vol. 24, No. 12, 2007, pp. B42-B51.
% This measure discriminates blur and Gaussian noise. Given a set of 
% registered images, the image showing the highest index is the best.
% Other functions that must be present in the path:
% localwigner.m, renyientropy.m, rad2deg
% Inputs:
% X: color or gray-scale image as double precission matrix
% N: window size in pixels (2, 4, 6, 8, ...)
% nod: number of directions (1, 2, 3, ...)
% firstangle: set the first orientation in degrees or radians. 
% angleunits: 'degree', 'radian' or 'slope'
% Outputs: 
% Qg: Anisotropic (gray-scale) quality index for image X
% Qch: Anisotropic (by R,G,B channels) quality index for image X
% By Salvador Gabarda 2011
% salvador@optica.csic.es
%%

import biqaa.*

[ro co la]=size(X);
angleerror=0;

if nargin==1
    N=8;
    nod=6;
    firstangle=0;
    angleunits='degree';
elseif nargin==2
    nod=6;
    firstangle=0;
    angleunits='degree';
elseif nargin==3
    firstangle=0;
    angleunits='degree';
elseif nargin==4
    angleunits='degree';
elseif nargin>4
    if isequal(angleunits,'radian')
        firstangle=rad2deg(firstangle);
    elseif isequal(angleunits,'degree')
        % no action taken
    else
        disp('unknown unit')
        angleerror=1;
    end
end

dang=180/nod;


mean_val=zeros(1,nod);
meanval=zeros(nod,la);

for k=1:nod
    if angleerror==1
        break
    end
    ang=(k-1)*dang;
    
    % mode gray-levels
    Y=(1/la)*sum(X,3);
    Y=orlain(Y,N/2);
    W=localwigner(Y,N,firstangle+ang,'degree');
    R=renyientropy(W);
    R=orlaoff(R,N/2);
    mean_val(k)=mean(R(:));
    
    
    if la>1
        % mode color by channels
        for q=1:la
            Y=orlain(X(:,:,q),N/2);
            W=localwigner(Y,N,firstangle+ang,'degree');
            R=renyientropy(W);
            R=orlaoff(R,N/2);
            meanval(k,q)=mean(R(:));
        end
    end
    
end

Qg=std(mean_val);
Qch=Qg;

if la>1
    for q=1:la
        channel=meanval(:,q);
        Qch(q)=std(channel);
    end
end
    
%%
function Y=orlain(X,p)
[ro co]=size(X);
Xup=X(1:p,:);
Xup=flipud(Xup);
Xbu=X(ro-p+1:ro,:);
Xbu=flipud(Xbu);
Xp=[Xup;X;Xbu];
Xle=Xp(:,1:p);
Xle=fliplr(Xle);
Xri=Xp(:,co-p+1:co);
Xri=fliplr(Xri);
Y=[Xle Xp Xri];
return


function Y=orlaoff(X,n)
[ro co]=size(X);
Y=X(n+1:ro-n,n+1:co-n);
return
   

   