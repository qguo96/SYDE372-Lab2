function [ output_args ] = NonparametricPlot2d( input_args )
%NONPARAMETRICPLOT2D Summary of this function goes here
%   Detailed explanation goes here

figure;
scatter(al(:,1), al(:,2))
hold on
scatter(bl(:,1), bl(:,2))
hold on
scatter(cl(:,1), cl(:,2))
hold on

contour(al_x, al_y, boundary);
title('Non Parametric Estimation - Parzen Method');
legend('al datapoints','bl datapoints','cl datapoints');
xlabel('x axis');
ylabel('y axis');

contour(al_x, al_y, boundary);

end

