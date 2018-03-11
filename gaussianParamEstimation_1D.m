function [mean, variance] = gaussianParamEstimation_1D(data)
    len = length(data);
    meanSum = 0;
    varSum = 0;
    
    % ML Estimation for Gaussian Mean (just Sample Mean)
    for i=1:len
        meanSum = meanSum + data(i);
    end    
    mean = meanSum/len; % Theta 1

    % ML Estimation for Gaussian Variance 
    for i=1:len
       varSum = varSum + (data(i) - mean)^2;
    end
    variance = varSum/len; % Theta 2    
end