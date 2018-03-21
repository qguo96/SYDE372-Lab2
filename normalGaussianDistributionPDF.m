function [pdf] = normalGaussianDistributionPDF (mean, sd, x)
    len = length(x);
    pdf = zeros(size(x,1));
    
    for i=1:len
        pdf(i) = exp((-((x(i)-mean).^2))/(2*sd^2))/(sqrt(2*pi)*sd);        
    end
end