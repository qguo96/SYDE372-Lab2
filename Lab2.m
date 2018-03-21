% Lab 2 - Model Estimation and Discriminant Functions
%% Load data 
load('N:\SYDE372-Labs\SYDE372-Lab2\lab2_1.mat')

% Note: remember to change the path of the lab files to your path 

%% Section 2 - Model Estimation 1D
% Setup variables 
a_minVal = min(a);
a_maxVal = max(a);
b_minVal = min(b);
b_maxVal = max(b);
x_a = a_minVal:0.01:a_maxVal;
x_b = b_minVal:0.01:b_maxVal;
a_mean = 5;
a_sd = 1;
b_lambda = 1;
a_grid = zeros(size(a));

%%
% Section 2 - Part 1
% 1) Parametric Estimation - Gaussian 
% Set A
[a_gauMean_1D, a_gauVar_1D ] = gaussianParamEstimation_1D(a);
a_normGaussian = normalGaussianDistributionPDF(a_gauMean_1D, a_gauVar_1D, x_a);
a_trueNormGaussian = normalGaussianDistributionPDF(a_mean, a_sd, x_a);
figure;
title('Parametric Estimation - Gaussian for Set A (1D)');
plot(x_a, a_normGaussian);
hold on;
plot(x_a, a_trueNormGaussian, 'Color', 'r');
hold on;
legend('Estimated p(x)','True p(x)'); % TODO: Fix legend ....
xlabel('x axis'); % x-axis label  % TODO: Fix axis ...
ylabel('y axis'); % y-axis label % TODO: Fix axis ...

% Set B 
[b_gauMean_1D, b_gauVar_1D ] = gaussianParamEstimation_1D(b);
b_normGaussian = normalGaussianDistributionPDF(b_gauMean_1D, b_gauVar_1D, x_b);
b_trueNormGaussian = normalExponentialDistributionPDF(b_lambda, x_b);
figure;
title('Parametric Estimation - Gaussian for Set B (1D)');
plot(x_b, b_normGaussian);
hold on;
plot(x_b, b_trueNormGaussian, 'Color', 'r');
hold on;
legend('Estimated p(x)','True p(x)'); % TODO: Fix legend ....
xlabel('x axis'); % x-axis label  % TODO: Fix axis ...
ylabel('y axis'); % y-axis label % TODO: Fix axis ...


%%
% Section 2 - Part 2
% 2) Parametric Estimation - Exponential 
% Set A
[a_expLambda_1D] = exponentialParamEstimation_1D(a);
a_normExponential = normalExponentialDistributionPDF(a_expLambda_1D, x_a);
a_trueNormExponential = normalGaussianDistributionPDF(a_mean, a_sd, x_a);
figure;
title('Parametric Estimation - Exponential for Set A (1D)');
plot(x_a, a_normExponential);
hold on;
plot(x_a, a_trueNormExponential, 'Color', 'r');
hold on;
legend('Estimated p(x)','True p(x)'); % TODO: Fix legend ....
xlabel('x axis'); % x-axis label  % TODO: Fix axis ...
ylabel('y axis'); % y-axis label % TODO: Fix axis ...

% Set B 
[b_expLambda_1D] = exponentialParamEstimation_1D(b);
b_normExponential = normalExponentialDistributionPDF(b_expLambda_1D, x_b);
b_trueNormExponential = normalExponentialDistributionPDF(b_lambda, x_b);
figure;
title('Parametric Estimation - Exponential for Set B (1D)');
plot(x_b, b_normExponential);
hold on;
plot(x_b, b_trueNormExponential, 'Color', 'r');
hold on;
legend('Estimated p(x)','True p(x)'); % TODO: Fix legend ....
xlabel('x axis'); % x-axis label  % TODO: Fix axis ...
ylabel('y axis'); % y-axis label % TODO: Fix axis ...


%%
% Section 2 - Part 3
% 3) Parametric Estimation - Uniform
% Set A
[a_uniA_1D, a_uniB_1D] = uniformParamEstimation_1D(a);
a_normUniform = normalUniformDistributionPDF(a_uniA_1D, a_uniB_1D, x_a);
a_trueNormUniform = normalGaussianDistributionPDF(a_mean, a_sd, x_a);
figure;
title('Parametric Estimation - Uniform for Set A (1D)');
plot(x_a, a_normUniform);
hold on;
plot(x_a, a_trueNormUniform, 'Color', 'r');
hold on;
legend('Estimated p(x)','True p(x)'); % TODO: Fix legend ....
xlabel('x axis'); % x-axis label  % TODO: Fix axis ...
ylabel('y axis'); % y-axis label % TODO: Fix axis ...

% Set B 
[b_uniA_1D, b_uniB_1D] = uniformParamEstimation_1D(b);
b_normUniform = normalUniformDistributionPDF(b_uniA_1D, b_uniB_1D, x_b);
b_trueNormUniform = normalExponentialDistributionPDF(b_lambda, x_b);
figure;
title('Parametric Estimation - Uniform for Set B (1D)');
plot(x_b, b_normUniform);
hold on;
plot(x_b, b_trueNormUniform, 'Color', 'r');
hold on;
legend('Estimated p(x)','True p(x)'); % TODO: Fix legend ....
xlabel('x axis'); % x-axis label  % TODO: Fix axis ...
ylabel('y axis'); % y-axis label % TODO: Fix axis ...



%%
% Section 2 - Part 4
% 4) Non-Parametric Estimation 

% For Gaussian Windows, assuming an h = 1 
sd_1 = 0.1;
sd_2 = 0.4;

% Set A
[a_parzanDensity1_1D] = parzanWindowEstimation_1D(a,sd_1);
[a_parzanDensity2_1D] = parzanWindowEstimation_1D(a,sd_2);
a_trueNormUniform = normalGaussianDistributionPDF(a_mean, a_sd, x_a);
figure;
title('Non Parametric Estimation - Parzan Method for Set A (1D)');
plot(x_a, a_parzanDensity1_1D);
hold on;
plot(x_a, a_parzanDensity2_1D, 'Color', 'r');
hold on;
plot(x_a, a_trueNormUniform, 'Color', 'g');
hold on;
legend('Parzan for Dataset A with SD = 0.1','Parzan for Dataset A with SD = 0.4','True p(x)'); % TODO: Fix legend ....
xlabel('x axis'); % x-axis label  % TODO: Fix axis ...
ylabel('y axis'); % y-axis label % TODO: Fix axis ...


% Set B
[b_parzanDensity1_1D] = parzanWindowEstimation_1D(b,sd_1);
[b_parzanDensity2_1D] = parzanWindowEstimation_1D(b,sd_2);
b_trueNormUniform = normalExponentialDistributionPDF(b_lambda, x_b);
figure;
title('Non Parametric Estimation - Parzan Method for Set B (1D)');
plot(x_b, b_parzanDensity1_1D);
hold on;
plot(x_b, b_parzanDensity2_1D, 'Color', 'r');
hold on;
plot(x_b, b_trueNormUniform, 'Color', 'g');
hold on;
legend('Parzan for Dataset B with SD = 0.1','Parzan for Dataset B with SD = 0.4','True p(x)'); % TODO: Fix legend ....
xlabel('x axis'); % x-axis label  % TODO: Fix axis ...
ylabel('y axis'); % y-axis label % TODO: Fix axis ...

