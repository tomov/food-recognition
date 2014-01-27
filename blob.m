function blob(pic, tau)

% Input
pic = im2double(rgb2gray(pic));

% Filtered gradient
height = size(pic, 1);
width = size(pic, 2);
n = 7;
Gs = zeros(height, width, n);
for i = 1:n
    sigma = sqrt(2)*i;
    Gs(:,:,i) = gaussianblur(pic,sigma,3);
end

DoG = Gs(:,:,2:end) - Gs(:,:,1:end-1);

% Scale selection & threshold
for i = 2:n-1
    i
    for y = 1:height
        for x = 1:width
            if abs(DoG(y,x,i)) < tau
                DoG(y,x,i) = 0;
                continue;
            end
            x1 = max([1 x-1]);
            x2 = min([width x+1]);
            y1 = max([1 y-1]);
            y2 = min([height y+1]);
            dmax = max(max(DoG(y1:y2, x1:x2, i)));
            dmin = min(min(DoG(y1:y2, x1:x2, i)));
            if (i > 1)
               dmax = max([dmax max(max(DoG(y1:y2, x1:x2, i-1)))]);
               dmin = min([dmin min(min(DoG(y1:y2, x1:x2, i-1)))]);
            end
            if (i < n-1)
               dmax = max([dmax max(max(DoG(y1:y2, x1:x2, i+1)))]);
               dmin = min([dmin min(min(DoG(y1:y2, x1:x2, i+1)))]);
            end
            if DoG(y,x,i) ~= dmax && DoG(y,x,i) ~= dmin
                DoG(y,x,i) = 0;
            end
        end
    end
end

% Marking corners
markedpic = pic;
for i = 2:n-1
    for y = 1:height
        for x = 1:width
            if DoG(y,x,i) > 0
                d = i * sqrt(2) / 2;
                rect = [max([1 y-d]) min([height y+d]); max([1 x-d]) min([width x+d])];
                rect = round(rect);
                markedpic(rect(1,1):rect(1,2), rect(2,1)) = 1000;
                markedpic(rect(1,1):rect(1,2), rect(2,2)) = 1000;
                markedpic(rect(1,1), rect(2,1):rect(2,2)) = 1000;
                markedpic(rect(1,2), rect(2,1):rect(2,2)) = 1000;
            end
        end
    end
end

% Print output
imshow(markedpic);
%filename = sprintf('blobs_%s_%.4f.jpg', infilename, tau);
%imwrite(markedpic, filename, 'jpg');
end