function [density] = parzanWindowEstimation_1D(data,sd)
    % Reference: http://www.personal.reading.ac.uk/~sis01xh/teaching/CY2D2/Pattern2.pdf
    dataLength=length(data);

    % x is row vector of len(data) evenly spaced points between min(data) and max(data)
    x = min(data):0.01:max(data);
    linspaceX = size(x,2);
    density = zeros(size(x));
    
    for i=1:linspaceX
        sum = 0;
        for j=1:size(data,2)
            sum = sum + exp(-(1/(2*sd^2))*(data(j) - x(i))^2)/(sqrt(2*pi)*sd);                   
        end
        density(i) = sum/dataLength;
    end
end