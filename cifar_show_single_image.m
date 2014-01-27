photo = data(3,:);
red = photo(1:1024);
green = photo(1025:1024+1024);
blue = photo(1024*2+1:1024*3);
r = reshape(red, 32, 32)';
g = reshape(green, 32, 32)';
b = reshape(blue, 32, 32)';
imshow(cat(3, r, g, b));
