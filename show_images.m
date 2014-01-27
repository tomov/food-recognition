category = 24; % which cateogry of food to display

idx = find(cell2mat(image_foods) == category);

%[~, idx, ~] = unique(cell2mat(image_foods));
%idx = idx';


dim = ceil(sqrt(size(idx, 2)));
figure;
for i=1:size(idx, 2)
    ii = idx(i);
    subplot(5, 10, i);
    img = images{ii};
    mask = masks{ii};
    
    [hue, sat, val] = rgb2hsv(img);
    imshow(imresize(img, 3));
    label = foods{image_foods{ii}};
    label = strrep(label, '_', ' ');
    xlabel(label);
    
    h = hue(:);
    m = mask(:);
    h(mask == 1) = [];
    %hist(h, 40);
end

