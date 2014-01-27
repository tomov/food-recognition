data_set_frac = 1; % only use 10% the dataset -- note that this is only the first 5 categories in the set

train_set_frac = 0.8;  % size of training set as fraction of all data points

%idx = find(cell2mat(image_foods) == category); -- extract all images from
%given category
n = int16(size(images, 2) * data_set_frac);

if exist('perm') == 0
    perm = randperm(n);
end
train_set_size = ceil(train_set_frac * n)
%train_idx = perm(1:train_set_size);  % image indices of training set
%test_idx = perm(train_set_size+1:n);  % image indices of test set
%train_idx = sort(train_idx);
%test_idx = sort(test_idx);

all_inputs = zeros(300 + 1004, n); % HARDCODED
categories = image_foods{n}; % SHOULD BE size(foods, 2)... in the end
all_targets = zeros(image_foods{n}, n); % HARDCODED

%gabor_me; % create gabor filters

%figure;
%dim = ceil(sqrt(train_set_size));
for i=1:n
    ii = perm(i);
    i
    
    mask = masks{ii};
    % REMOVE MASKS!!!
    %if sum(mask(:)) > size(mask, 1) * size(mask, 2) * 0.75 % if > 75% of the image is masked out
        % remove the mask
        mask = zeros(size(mask));
    %end
    
    %subplot(dim, dim, i);
    %mask = 1 - medfilt2(1 - mask, [10 10]);
    %masks{ii} = mask;    
    %imshow(mask);
    
    % get input vector for ANN
    img = images{ii};
    %img = normalize(img, mask);
    
    input_vec = features(img, mask, hvqenc, centers, gabors);
    
    input_vec = [input_vec; all_inputs_3(:, i)];
    
    all_inputs(:,i) = input_vec;
    
    % get target vector for ANN
    category = image_foods{ii};
    target_vec = zeros(categories, 1);
    target_vec(category) = 1;
    all_targets(:,i) = target_vec;
end

%break

inputs = all_inputs(1:1304,1:train_set_size);
targets = all_targets(:,1:train_set_size);

inputs_test = all_inputs(1:1304,train_set_size+1:end);
targets_test = all_targets(:,train_set_size+1:end);

neural_train