function plotErrors(error,titleOfGraph)
    figure;
    title(titleOfGraph);
    hold on;
    plot(error);
    xlabel('Iteration');
    ylabel('Error');
end