% Lab 2 - Model Estimation and Discriminant Functions

%% Section 2 - Model Estimation 1D

% Load data for Section 2
load('N:\SYDE372-Labs\SYDE372-Lab2\lab2_1.mat')

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
box on
hold on;
plot(x_a, a_normGaussian);
hold on;
plot(x_a, a_trueNormGaussian, 'Color', 'r');
hold on;
legend('Estimated p(x)','True p(x)');
xlabel('x'); % x-axis label
ylabel('p(x)'); % y-axis label

% Set B
[b_gauMean_1D, b_gauVar_1D ] = gaussianParamEstimation_1D(b);
b_normGaussian = normalGaussianDistributionPDF(b_gauMean_1D, b_gauVar_1D, x_b);
b_trueNormGaussian = normalExponentialDistributionPDF(b_lambda, x_b);
figure;
title('Parametric Estimation - Gaussian for Set B (1D)');
box on
hold on;
plot(x_b, b_normGaussian);
hold on;
plot(x_b, b_trueNormGaussian, 'Color', 'r');
hold on;
legend('Estimated p(x)','True p(x)');
xlabel('x'); % x-axis label
ylabel('p(x)'); % y-axis label


%%
% Section 2 - Part 2
% 2) Parametric Estimation - Exponential
% Set A
[a_expLambda_1D] = exponentialParamEstimation_1D(a);
a_normExponential = normalExponentialDistributionPDF(a_expLambda_1D, x_a);
a_trueNormExponential = normalGaussianDistributionPDF(a_mean, a_sd, x_a);
figure;
title('Parametric Estimation - Exponential for Set A (1D)');
box on
hold on;
plot(x_a, a_normExponential);
hold on;
plot(x_a, a_trueNormExponential, 'Color', 'r');
hold on;
legend('Estimated p(x)','True p(x)');
xlabel('x'); % x-axis label
ylabel('p(x)'); % y-axis label

% Set B
[b_expLambda_1D] = exponentialParamEstimation_1D(b);
b_normExponential = normalExponentialDistributionPDF(b_expLambda_1D, x_b);
b_trueNormExponential = normalExponentialDistributionPDF(b_lambda, x_b);
figure;
title('Parametric Estimation - Exponential for Set B (1D)');
box on
hold on;
plot(x_b, b_normExponential);
hold on;
plot(x_b, b_trueNormExponential, 'Color', 'r');
hold on;
legend('Estimated p(x)','True p(x)');
xlabel('x'); % x-axis label
ylabel('p(x)'); % y-axis label


%%
% Section 2 - Part 3
% 3) Parametric Estimation - Uniform
% Set A
[a_uniA_1D, a_uniB_1D] = uniformParamEstimation_1D(a);
a_normUniform = normalUniformDistributionPDF(a_uniA_1D, a_uniB_1D, x_a);
a_trueNormUniform = normalGaussianDistributionPDF(a_mean, a_sd, x_a);
figure;
title('Parametric Estimation - Uniform for Set A (1D)');
box on
hold on;
plot(x_a, a_normUniform);
hold on;
plot(x_a, a_trueNormUniform, 'Color', 'r');
hold on;
legend('Estimated p(x)','True p(x)');
xlabel('x'); % x-axis label
ylabel('p(x)'); % y-axis label

% Set B
[b_uniA_1D, b_uniB_1D] = uniformParamEstimation_1D(b);
b_normUniform = normalUniformDistributionPDF(b_uniA_1D, b_uniB_1D, x_b);
b_trueNormUniform = normalExponentialDistributionPDF(b_lambda, x_b);
figure;
title('Parametric Estimation - Uniform for Set B (1D)');
box on
hold on;
plot(x_b, b_normUniform);
hold on;
plot(x_b, b_trueNormUniform, 'Color', 'r');
hold on;
legend('Estimated p(x)','True p(x)');
xlabel('x'); % x-axis label
ylabel('p(x)'); % y-axis label



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

% Set B
[b_parzanDensity1_1D] = parzanWindowEstimation_1D(b,sd_1);
[b_parzanDensity2_1D] = parzanWindowEstimation_1D(b,sd_2);
b_trueNormUniform = normalExponentialDistributionPDF(b_lambda, x_b);

% Plot for SD = 0.1
figure;
title('Non Parametric Estimation - Parzan Method for SD = 0.1 (1D)');
box on
hold on;
plot(x_a, a_parzanDensity1_1D);
hold on;
plot(x_b, b_parzanDensity1_1D);
hold on;
plot(x_a, a_trueNormUniform, 'Color', 'g');
hold on;
plot(x_b, b_trueNormUniform, 'Color', 'black');
hold on;
legend('Parzan for set A with SD = 0.1','Parzan for set A with SD = 0.1','True p(x) for Set A', 'True p(x) for Set B');
xlabel('x'); % x-axis label
ylabel('p(x)'); % y-axis label

% Plot for SD = 0.4
figure;
title('Non Parametric Estimation - Parzan Method for SD = 0.4 (1D)');
box on
hold on;
plot(x_a, a_parzanDensity2_1D);
hold on;
plot(x_b, b_parzanDensity2_1D);
hold on;
plot(x_a, a_trueNormUniform, 'Color', 'g');
hold on;
plot(x_b, b_trueNormUniform, 'Color', 'black');
hold on;
legend('Parzan for set A with SD = 0.4','Parzan for set A with SD = 0.4','True p(x) for Set A', 'True p(x) for Set B');
xlabel('x'); % x-axis label
ylabel('p(x)'); % y-axis label

%% Section 3 - Model Estimation 2-D Case
% Load data for Section 3
 load('N:\SYDE372-Labs\SYDE372-Lab2\lab2_2.mat')

 %% Section 3 - Part 1
 % First get the covarience and mean of the values
 min_x = min([al(:,1);bl(:,1); cl(:,1)])-1;
 max_x = max([al(:,1);bl(:,1); cl(:,1)])+1;
 min_y = min([al(:,2);bl(:,2); cl(:,2)])-1;
 max_y = max([al(:,2);bl(:,2); cl(:,2)])+1;

 x = min_x:1:max_x;
 y = min_y:1:max_y;
 [x1, y1] = meshgrid(x, y);

 mean_al = [mean(al(:,1)); mean(al(:,2))];
 mean_bl = [mean(bl(:,1)); mean(bl(:,2))];
 mean_cl = [mean(cl(:,1)); mean(cl(:,2))];

 cov_al = getCov(al,mean_al);
 cov_bl = getCov(bl,mean_bl);
 cov_cl = getCov(cl,mean_cl);

 % Now will use the testing data to get the rest of the components
 Class_a_b_ML = getMap(cov_al,cov_bl,mean_al',mean_bl',x1,y1);
 Class_a_c_ML = getMap(cov_al,cov_cl,mean_al',mean_cl',x1,y1);
 Class_b_c_ML = getMap(cov_bl,cov_cl,mean_bl',mean_cl',x1,y1);
 Mesh_Grid_Plot_1 = mapClassifyMulticlass(x1,y1,Class_a_b_ML,Class_a_c_ML,Class_b_c_ML);
 ParametricPlot2d(x1,y1,Mesh_Grid_Plot_1,at,bt,ct);

 %%
 % Section 3 - Part 2
 % 4) Non-Parametric Estimation

 precision = 500;
 variance = 400;

 win = makeGaussianWindow(-200, -200, 200, 200, variance, precision);
 res = [1 min_x min_y max_x max_y];

 [al_pdf, al_x, al_y] = parzenWindowEstimation_2D( al, res, win );
 [bl_pdf, bl_x, bl_y] = parzenWindowEstimation_2D( bl, res, win );
 [cl_pdf, cl_x, cl_y] = parzenWindowEstimation_2D( cl, res, win );

 Mesh_Grid_Plot_2 = mlNonParametric(al_pdf, bl_pdf, cl_pdf);
 NonparametricPlot2d(al_x, al_y, Mesh_Grid_Plot_2, al, bl, cl);

%% Section 4 - Sequential Discriminants

% Load data for Section 4
load('N:\SYDE372-Labs\SYDE372-Lab2\lab2_3.mat')

% Mesh Grid for MED Classification
x1 = linspace(min([a(:,1);b(:,1)]), max([a(:,1);b(:,1)]), 100);
y1 = linspace(min([a(:,2);b(:,2)]), max([a(:,2);b(:,2)]), 100);

% Deliverable 1: Learn 3 sequential classifiers
performSequentialEstimation(x1,y1,a,b,1,1);
performSequentialEstimation(x1,y1,a,b,1,2);
performSequentialEstimation(x1,y1,a,b,1,3);

% Deliverable 3: J = 5 with 20 calculations
performSequentialEstimation(x1,y1,a,b,5,0);
