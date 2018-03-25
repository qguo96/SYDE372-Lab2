function plotMap3(x,y,map,Class1, Class2, Class3) 
    figure;
    title('MAP for Class C, D, and E');
    Class1 = scatter(Class1(:,1), Class1(:,2));
    hold on;
    Class2 = scatter(Class2(:,1), Class2(:,2));
    hold on;
    Class3 = scatter(Class3(:,1), Class3(:,2));
    hold on;

    % Plotting the MAP regions
    contour(x,y,map,[-100, 0]);
    % Plotting the MAP decision boundary
    contour(x,y,map,2,'Color','k');
    legend([Class1 Class2 Class3],{'Class C', 'Class D', 'Class E'});
    xlabel('x');
    ylabel('y');
end