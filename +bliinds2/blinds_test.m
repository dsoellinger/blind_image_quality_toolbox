image = double(imread('img3.png'));

features = bliinds2_feature_extraction(image)
score = bliinds_prediction(features)