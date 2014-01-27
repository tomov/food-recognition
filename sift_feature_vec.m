function [ input_vec ] = sift_feature_vec(img, mask)

% NOT THIS ONE.. THIS IS SHIT

I = single(rgb2gray(img));

[f, d] = vl_sift(I);

z = f(3:4,:)';
%h = histcn(z, [1:0.25:4.5 5:10], -1:0.1:1);
h = histcn(z, 14, 14) / size(z,1);
h = h(:);

input_vec = h;