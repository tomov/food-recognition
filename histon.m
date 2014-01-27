function h = histon( img, mask )
%UNTITLED13 Summary of this function goes here
%   Detailed explanation goes here

rgbbins = 4;

r = img(:,:,1);
g = img(:,:,2);
b = img(:,:,3);

rr = r(:);
gg = g(:);
bb = b(:);
mm = mask(:);

rr(mm == 1) = [];
gg(mm == 1) = [];
bb(mm == 1) = [];

X = [rr gg bb];

[N edges mid loc] = histcn(X, rgbbins-1, rgbbins-1, rgbbins-1);

N = N / size(rr, 1);
h = reshape(N, [rgbbins^3 1]);
end

