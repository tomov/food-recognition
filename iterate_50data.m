x_dim = 100; % standardized X dimension of images -- all are scaled to that

foods = {};  % food categories to learn to distinguish
images = {};   % input traning and query data
image_foods = {}; % food type in each input image
masks = {};      % image masks

% iterate over directories
directory = '50data/';
categoryfiles = dir(strcat(directory, '*'));      
ndirs = length(categoryfiles);    % Number of files found

idx = 0;
for jj=1:ndirs
   if categoryfiles(jj).name(1) == '.', continue; end
   dirname = categoryfiles(jj).name;
   fulldirname = strcat(directory, dirname);
   if isdir(fulldirname) == 0, continue; end

   % add category
   foods{end+1} = dirname
 
   % iterate over images in directory
   imagefiles = dir(strcat(fulldirname, '/*'));      
   nfiles = length(imagefiles);    % Number of files found
 
   for ii=1:nfiles
       if imagefiles(ii).name(1) == '.', continue; end
       fname = imagefiles(ii).name
       
       file_ext = strsplit(fname, '.')
       file_ext = file_ext(2);
       file_ext = file_ext{1};
       if strcmp(file_ext, 'gif') == 1, continue; end
       fullfilename = strcat(fulldirname, '/', fname);
       if isdir(fullfilename), continue; end

       % load and resize image
       img = imread(fullfilename);
       if size(size(img), 2) < 3, continue; end % reject grayscale images
       
       img = imresize(img, x_dim / size(img, 1));
       img = im2double(img);
       
       % add image to data
       idx = idx + 1;
       images{idx} = img;                  % store image
       masks{idx} = preprocess(img);      % store mask
       image_foods{idx} = size(foods, 2);
   end
end
