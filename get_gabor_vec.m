function vec = get_gabor_vec( img, mask, gabors )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

vec = [];

N = size(gabors, 2);

for i = 1:N
    gb = gabors{i};
    
    img_in = im2double(rgb2gray(img));
    img_in = imresize(img_in, 1);
    %subplot(4, N, i);
    %imshow(img_in);

    img_out = imfilter(img_in, gb, 'symmetric');
    %subplot(4, N, i + 2*N);
    %imshow(img_out);
    
    gg = imresize(img_out, [8 8], 'method', 'box');
    %subplot(4, N, i + 3*N);
    %imshow(abs(gg));
    
    vec = [vec; abs(gg(:))];
end




end

