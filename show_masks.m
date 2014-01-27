 


iii = [535 781   849    51    1168    583    724    1123];

figure;
n = size(iii, 2);
for i = 1:n
    ii = iii(i);
    img = images{ii};
    mask  = masks{ii};
    subplot(2,n,i);
    imshow(img);
    subplot(2,n,i+n);
    mask = medfilt2(1 - mask, [10 10]);
    imshow(mask);
end