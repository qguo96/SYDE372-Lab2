function [lambda] = exponentialParamEstimation_1D(data)
    len=length(data);
    sum = 0;
    for i=1:len
       sum = sum + data(i); 
    end
    lambda = len/sum;
end