x_dim = 100; % standardized X dimension of images -- all are scaled to that

foods = {};  % food categories to learn to distinguish
images = {};   % input traning and query data
image_foods = {}; % food type in each input image
masks = {};      % image masks

% iterate over files
directory = 'data/';
imagefiles = dir(strcat(directory, '*'));      
nfiles = length(imagefiles);    % Number of files found
idx = 0;
for ii=1:nfiles
   % get image filename
   if imagefiles(ii).name(1) == '.', continue; end
   fname = imagefiles(ii).name
   fullfilename = strcat(directory, fname);
   if isdir(fullfilename), continue; end
   
   % load and resize image
   img = imread(fullfilename);
   img = imresize(img, x_dim / size(img, 1));
   img = im2double(img);
   
   % add image to data
   idx = idx + 1;
   images{idx} = img;                  % store image
   masks{idx} = preprocess(img);      % store mask
   
   % extract and store food type
   fname_components = strsplit(fname, '-');
   food = fname_components(1);
   if size(strmatch(food, foods), 1) == 0
       foods{end+1} = food{1};         % store food category
   end
   image_foods{idx} = size(foods, 2);   % store food type in image
   
   %currentimage = imread(currentfilename);
   %positives{idx} = currentimage;
   %feat = ImgHOGFeature(currentfilename, SkipStep, BinNum, Angle, CellSize, gaussian);
   %feat = feat(:)';
   %feat = imresize(feat, [1 4000]);
   %if size(training,1) == 0, training = feat;
   %else training = [training; feat];
   %end
   %group = [group; 1];
end



