function [ input_vec ] = get_feature_vec(img, mask, hvqenc, sumA, gabors)
%UNTITLED11 Summary of this function goes here
%   Detailed explanation goes here


input_vec = [];


% histogram of oriented gradients


input_vec = HOG(img);

% ignore features after this line.... b/c MATLAB has no comments
save_input_vec = input_vec;





% Gabor filters

%input_vec = get_gabor_vec(img, mask, gabors);





% SIFT descriptors

intput_vec = [];

[f, d] = get_sift_vec(img, mask, 1);

%D = double(d');
%D = bsxfun(@rdivide,D,sumA);
%D = D';

%[~, ind] = min(vl_alldist(double(d), centers)');
%vec = hist(ind, 256) / size(d, 2); % HARDCODED = codeword_cnt from sift.m
%input_vec = [input_vec; vec];

% FUCK MATLAB's k-means clustering crap...
[ind, cw, err] = step(hvqenc, double(d));
ind = ind(1:min(100, size(f, 2))); % HARCODED = standard_number_of_featurs from get_sift_vec.m
vec = zeros(256, 1); % HARDCODED = codeword_cnt from sift.m
vec(ind + 1) = 1;
input_vec = [input_vec; vec];





input_vec = [];


% 4x4x4 RGB histo from every subquadrant

n = int16(size(img, 1) / 2);
m = int16(size(img, 2) / 2);
for i=0:1
    for j=0:1
        ii = imcrop(img, [m*i n*j m n]);
        mm = imcrop(mask, [m*i n*j m n]);
        
        %subplot(2,2, i+j*2+1);
        %imshow(mm);
        
        f = histon(ii, mm);
        input_vec = [input_vec; f];
    end
end



% 4x4x4 RGB histo of middle quadrant

ii = imcrop(img, [int16(m/2) int16(n/2) m n]);
mm = imcrop(mask, [int16(m/2) int16(n/2) m n]);
f = histon(ii, mm);
input_vec = [input_vec; f];









% 4x4x4 RGB histo from whole image

f = histon(img, mask);
input_vec = [input_vec; f];



input_vec = [];

% RGB histo from whole image; independent channels

nbins = 10;

r = img(:,:,1);
g = img(:,:,2);
b = img(:,:,3);

[f, x] = histo(r, mask, nbins);
input_vec = [input_vec; f'];
[f, x] = histo(g, mask, nbins);
input_vec = [input_vec; f'];
[f, x] = histo(b, mask, nbins);
input_vec = [input_vec; f'];



% RGB histo from every subquadrant; independent channels

[f, x] = histo(r(1:n, 1:m), mask(1:n,1:m), nbins);
input_vec = [input_vec; f'];
[f, x] = histo(r(n:end, 1:m), mask(n:end,1:m), nbins);
input_vec = [input_vec; f'];
[f, x] = histo(r(1:n, m:end), mask(1:n,m:end), nbins);
input_vec = [input_vec; f'];
[f, x] = histo(r(n:end, m:end), mask(n:end,m:end), nbins);
input_vec = [input_vec; f'];

[f, x] = histo(g(1:n, 1:m), mask(1:n,1:m), nbins);
input_vec = [input_vec; f'];
[f, x] = histo(g(n:end, 1:m), mask(n:end,1:m), nbins);
input_vec = [input_vec; f'];
[f, x] = histo(g(1:n, m:end), mask(1:n,m:end), nbins);
input_vec = [input_vec; f'];
[f, x] = histo(g(n:end, m:end), mask(n:end,m:end), nbins);
input_vec = [input_vec; f'];

[f, x] = histo(b(1:n, 1:m), mask(1:n,1:m), nbins);
input_vec = [input_vec; f'];
[f, x] = histo(b(n:end, 1:m), mask(n:end,1:m), nbins);
input_vec = [input_vec; f'];
[f, x] = histo(b(1:n, m:end), mask(1:n,m:end), nbins);
input_vec = [input_vec; f'];
[f, x] = histo(b(n:end, m:end), mask(n:end,m:end), nbins);
input_vec = [input_vec; f'];


input_vec = save_input_vec;

end

