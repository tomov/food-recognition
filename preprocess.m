function [mask] = preprocess(rgb)  % assumes it's resized and converted to double

hsv = rgb2hsv(rgb);
%gray = rgb2gray(rgb);

img = rgb2gray(rgb);
n = size(img,1);
m = size(img,2);
%coef = zeros(n, m);

xs = [];
ys = [];
border = size(img, 1) / 20;
for i = 1:n
    for j = 1:m
        if i > border && i < n - border + 1 && j > border && j < m - border + 1
            continue;
        end
        %frac = ((i-n/2)^2 + (j-m/2)^2) / (n^2/4 + m^2/4);
        %coef(i, j) = frac;
        
        %if rand > 1 - frac ^ 20 / 10
        if rand > 0.9
            xs = [xs i];
            ys = [ys j];
        end
    end
end

% get edges and make them thick
e = edge(img, 'sobel');
e = e + circshift(e, [0 1]) + circshift(e, [1 0]) + circshift(e, [0 -1]) + circshift(e, [-1 0]);
%e = e + circshift(e, [0 1]) + circshift(e, [1 0]) + circshift(e, [0 -1]) + circshift(e, [-1 0]);

% add edges to color image to prevent magic wand from erasing food
rgb_new = rgb;
for k = 1:3
    rgb_new(:,:,k) = rgb_new(:,:,k) + e;
end

% remove background using magic wand
mask = magicwand(rgb_new, xs, ys, 0.05);


%rgb_new = rgb;
%for k = 1:3
    %rgb_new(:,:,k) = rgb_new(:,:,k) - mask * 10;
%end
