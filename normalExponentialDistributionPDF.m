function [pdf] = normalExponentialDistributionPDF(lambda, x)
    len = length(x);
    pdf = zeros(size(x,1));
    
    for i=1:len
       pdf(i) = lambda*exp(x(i)*lambda*-1); 
    end
end