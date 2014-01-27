function [f, x] = histo(hue, mask, nbins)  % takes n-by-m image feature and mask and returns normalized histogram of feature

h = hue(:);  % vectorize hue and mask to get histogram
m = mask(:);
h(mask == 1) = [];  % remove background hue pixels found in preprocess
[f, x] = hist(h, nbins); % get hue histogram
dx = diff(x(1:2));
s = sum(f*dx);
if s == 0, s = 1; end
f = f / s; % normalize histogram


