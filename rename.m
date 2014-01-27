directory = 'temp/';
imagefiles = dir(strcat(directory, '*'));      
nfiles = length(imagefiles);    % Number of files found
idx = 0;

bla_idx = 16;
base = 'omelette';

for ii=1:nfiles
   % get image filename
   if imagefiles(ii).name(1) == '.', continue; end
   fname = imagefiles(ii).name;
   fullfilename = strcat(directory, fname);
   if isdir(fullfilename), continue; end

   split = strsplit(fullfilename, '.');
   ext = split(2);
   bla_idx = bla_idx + 1;
   newname = strcat(directory, base, '-', int2str(bla_idx), '.', ext{1})
   movefile(fullfilename, newname);
end