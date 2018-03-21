function [pdf] = normalUniformDistributionPDF(a, b, x)
    len = length(x);
    pdf = zeros(size(x,1));
    
    for i=1:len
        pdf(i) = 1/(b-a);         
    end
end