function NonparametricPlot2d( al_x, al_y, Mesh_Grid_Plot_2, al, bl, cl )
    figure;
    scatter(al(:,1), al(:,2))
    hold on
    scatter(bl(:,1), bl(:,2))
    hold on
    scatter(cl(:,1), cl(:,2))
    hold on

    contour(al_x, al_y, Mesh_Grid_Plot_2, 'color', 'k');
    title('Non Parametric Estimation - Parzen Method');
    legend('at datapoints','bt datapoints','ct datapoints');
    xlabel('x axis');
    ylabel('y axis');
end