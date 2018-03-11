% Lab 2 - Model Estimation and Discriminant Functions
%% Load data 
load('N:\SYDE372-Labs\SYDE372-Lab2\lab2_1.mat')

% Note: remember to change the path of the lab files to your path 

%% Section 2 - Model Estimation 1D
% 1) Parametric Estimation - Gaussian 
[gauAMean_1D, gauAVar_1D ] = gaussianParamEstimation_1D(a);
[gauBMean_1D, gauBVar_1D ] = gaussianParamEstimation_1D(b);
% TODO: Need to plot these two 

% 2) Parametric Estimation - Exponential 
[expALambda_1D] = exponentialParamEstimation_1D(a);
[expBLambda_1D] = exponentialParamEstimation_1D(b);
% TODO: Need to plot these two 

% 3) Parametric Estimation - Uniform
[uniA1_1D, uniA2_1D] = uniformParamEstimation_1D(a);
[uniB1_1D, uniB2_1D] = uniformParamEstimation_1D(b);
% TODO: Need to plot these two 

% 4) Non-Parametric Estimation 
% TODO: Got to figure out how to find 'h' value 