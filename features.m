function [ input_vec ] = features(img, mask, hvqenc, centers, gabors)

input_vec = [];

%input_vec = [input_vec; HOG(img)];

%input_vec = [input_vec; rgb_feature_vec(img, mask)];


%input_vec = get_gabor_vec(img, mask, gabors);


[f, d] = get_sift_vec(img, mask, 0);
[~, ind] = min(vl_alldist(double(d), centers)');
%vec = hist(ind, 300); % HARDCODED = codeword_cnt from sift.m
vec = zeros(300, 1); % HARDCODED = codeword_cnt from sift.m
vec(ind) = 1;
input_vec = [input_vec; vec];


%[f, d] = get_sift_vec(img, mask, 1);
%[ind, cw, err] = step(hvqenc, double(d));
%ind = ind(1:min(100, size(f, 2))); % HARCODED = standard_number_of_featurs from get_sift_vec.m
%vec = zeros(256, 1); % HARDCODED = codeword_cnt from sift.m
%vec(ind + 1) = 1;
%input_vec = [input_vec; vec];




