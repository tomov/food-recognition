function [blurpic] = gaussianblur(pic, sigma, sigmas)
    g = gauss(sigma, sigmas);
    blurpic = conv2(pic, g, 'same');    
end