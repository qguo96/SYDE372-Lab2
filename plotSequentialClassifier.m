function plotSequentialClassifier(A,B,x1,y1,G,num)
    % Plot 
    [X,Y] = meshgrid(x1,y1);
    figure;
    if (num == 0)
        title("Sequential Classifier ");
    else
        title("Sequential Classifier " + num);
    end    
    hold on;
    scatter(A(:,1), A(:,2));
    hold on
    scatter(B(:,1), B(:,2));
    hold on
    contour(X, Y, G);
    xlabel('x-axis'); %TODO Change
    ylabel('y-axis'); %TODO Change
end