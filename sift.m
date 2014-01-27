codeword_cnt = 300;  % 300 and it cannot quantize it later...

all_ds = [];

% NOTE: MUST RUN THIS AGAIN EVERY TIME YOU EXPAND THE DATASET --!!!!! YOUR
% BIG MISTAKE
% => first run svm_train.m
for i=1:n
    ii = perm(i);
    i

    img = images{ii};
    mask = masks{ii};

    [f, d] = get_sift_vec(img, mask, 0);
    
    % add to all descriptors
    all_ds = [all_ds d];
end


 % centers must have each COLUMN as a codeword (and # rows = # descriptors
 % = 128)
 % so size(centers) = [128 23234234234]
 
 %A = double(all_ds');
 %sumA = sum(A);
 %B = bsxfun(@rdivide,A,sumA);
 %B = B';
 [centers, assignments] = vl_kmeans(double(all_ds), codeword_cnt);

 
 
 
 

 
 % FUCK MATLAB's kmeans -- too slow...
 
 %[idx,cent,sumdist] = kmeans(double(all_ds'),codeword_cnt);
 % each row of cent is a codeword of 128 entries => must rotate so that
 % each COLUMN is a codeword
 % and number of rows = 128 (dimensions of single sift descriptor)
 %cent = cent';
 hvqenc = dsp.VectorQuantizerEncoder(...
    'Codebook', centers, ...
    'CodewordOutputPort', true, ...
    'QuantizationErrorOutputPort', true, ...
    'OutputIndexDataType', 'uint8');

% Generate an input signal with some additive noise    
%x = sign(rand(2,40)-0.5) + 0.1*randn(2,40);
%[ind, cw, err] = step(hvqenc, x);
%plot(cw(1,:), cw(2,:), 'rO', x(1,:), x(2,:), 'g.');
%legend('Quantized', 'Inputs', 'location', 'best');