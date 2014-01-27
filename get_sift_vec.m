function [ f, d ] = get_sift_vec(img, mask, pad_to_100)

    I = single(rgb2gray(img));
    [f,d] = vl_sift(I) ;

    % only leave points inside the food item
%    new_d = [];
%    new_f = [];
%    for j = 1:size(f,2)
%        if mask(int16(f(2,j)), int16(f(1,j))) == 0
%            % it is part of the food item => append to new list
%            new_d = [new_d d(:,j)];
%            new_f = [new_f f(:,j)];
%        end
%    end
%    d = new_d;
%    f = new_f;

    
    
    
    
    
    
    
    
    
    
    
    
    
    % FUCK matlab's k-means...
    %
    % normalize length of d... b/c of fucking vector quantization step
    % thing which always wants to have the same size of the input...
    if pad_to_100 == 1
        standard_number_of_featurs = 100;
        if size(d, 2) >= standard_number_of_featurs
            d = d(:,1:standard_number_of_featurs);
        else
            d = [d zeros(size(d, 1), standard_number_of_featurs - size(d, 2))];
        end
    end