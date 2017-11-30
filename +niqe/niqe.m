function [score] = niqe(image)
    
    load '+niqe/modelparameters.mat'
 
    blocksizerow    = 96;
    blocksizecol    = 96;
    blockrowoverlap = 0;
    blockcoloverlap = 0;

    score = niqe.computequality(image,blocksizerow,blocksizecol,blockrowoverlap,blockcoloverlap,mu_prisparam,cov_prisparam);

end