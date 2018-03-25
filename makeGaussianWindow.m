function [gauss_win] = makeGaussianWindow ...
    (min_x, min_y, max_x, max_y, variance, precision)
    %reference: https://www.mathworks.com/help/stats/multivariate-normal-distribution.html
    mu = [0 0]; %
    sigma = [variance 0; 0 variance];
    x1 = linspace(min_x, max_x, precision);
    x2 = linspace(min_y, max_y, precision);
    [X1,X2] = meshgrid(x1,x2);
    gauss_pdf = mvnpdf([X1(:) X2(:)], mu, sigma);
    gauss_win = reshape(gauss_pdf, length(X2), length(X1));
end