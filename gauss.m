function [g] = gauss(sigma, sigmas)
    sig = round(sigma);
    x = ones(sig*sigmas*2+1, 1) * [sig*sigmas:-1:0 1:1:sig*sigmas];
    y = x';
    g = 1/(2*pi*sigma^2) * exp(-(x.^2 + y.^2)/(2*sigma^2));
end