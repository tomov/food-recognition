function [ input_vec ] = rgb_feature_vec(img, mask)

input_vec = [];

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






