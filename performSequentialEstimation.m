function performSequentialEstimation(x1,y1,A,B,J,num)
    [discriminants, true_n_ab, true_n_ba] = sequentialClassifier(A,B,0);

    if (J == 1)
        lenX = prod(size(x1));
        lenY = prod(size(y1));
        [X,Y] = meshgrid(x1,y1);

        % Section 4 - Question 1 (J is Infinity) 
        % Get list of discriminants 
        estimation = zeros(lenX,lenY); 
        for i = 1:lenX
           for j = 1:lenY
                estimation(i,j) = classifyClasses(J, X(i,j),Y(i,j), discriminants, true_n_ab, true_n_ba);
           end
        end

        % Plot 
        plotSequentialClassifier(A,B,x1,y1,estimation,num);
    end
    if (J > 1)            
        K = 20; % Do calculations 20 times, as per required 
        [avgError,minError,maxError,sdError] = findError(A,B,J,K,discriminants,true_n_ab,true_n_ba); 
                
        % Plot the following error rates:
        % a) Average Error Rate
        plotErrors(avgError,'Average Error Rate');

        % b) Minimum Error Rate 
        plotErrors(minError,'Minimum Error Rate');

        % c) Maximum Error Rate 
        plotErrors(maxError,'Maximum Error Rate');

        % d) Standard Deviation of the Error Rates 
        plotErrors(sdError,'Standard Deviation of Error Rate');   
    end
end