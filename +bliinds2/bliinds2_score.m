function [ score ] = bliinds2_score( image )
%BLIINDS2_SCORE Summary of this function goes here
%   Detailed explanation goes here

    import bliinds2.*
    
    features = bliinds2_feature_extraction(image);
    score = bliinds_prediction(features);

end

