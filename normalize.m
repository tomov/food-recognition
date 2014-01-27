function output = normalize( img , mask )
%UNTITLED12 Summary of this function goes here
%   Detailed explanation goes here

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

r = (r - mean(rr)) / std(rr);
g = (g - mean(gg)) / std(gg);
b = (b - mean(bb)) / std(bb);

%r = reshape(rr, size(img, 1), size(img, 2));
%g = reshape(gg, size(img, 1), size(img, 2));
%b = reshape(bb, size(img, 1), size(img, 2));

output = img;
output(:,:,1) = r;
output(:,:,2) = g;
output(:,:,3) = b;

end

