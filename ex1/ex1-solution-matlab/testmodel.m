function model_error = testmodel(Train_data,Test_data)
%% Initialization

%% ================ Part 1: Feature Normalization ================

%% Clear and Close Figures
%%clear ; close all; clc
%%fprintf('Loading data ...\n');

%% Load Data (I'll send data as input parameter)
%data = load('ex1data2.txt');
[m,n]=size(Train_data);
Train_X = Train_data(:,1:n-1);
Train_Y = Train_data(:,n);
%m = length(Train_Y);

% Print out some data points
%fprintf('First 10 examples from the dataset: \n');
%fprintf(' Train_X = [%.0f %.0f], Train_Y = %.0f \n', [Train_X(1:10,:) Train_Y(1:10,:)]');

%fprintf('Program paused. Press enter to continue.\n');
%%%pause;

% Scale features and set them to zero mean
%%fprintf('Normalizing Features ...\n');

[Train_X mu sigma] = featureNormalize(Train_X);

%Descrise size 
mu = mu(1,:);
sigma = sigma(1,:);


% Add intercept term to Train_X
Train_X = [ones(m, 1) Train_X];
%Test_X = [ones(m, 1) Test_X];


%% ================ Part 2: Gradient Descent ================
% Hint: At prediction, make sure you do the same feature normalization.
%

%%fprintf('Running gradient descent ...\n');

% Choose some alpha value
alpha = 0.01;
num_iters = 400;

% Init Theta and Run Gradient Descent 
theta = zeros(3, 1);
[theta, J_history] = gradientDescentMulti(Train_X, Train_Y, theta, alpha, num_iters);

% Plot the convergence graph

hold on
plot(1:numel(J_history), J_history, '-b', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost J');

% Display gradient descent's result
%fprintf('Theta computed from gradient descent: \n');
%fprintf(' %f \n', theta);
%fprintf('\n');

% Estimate the price of a 1650 sq-ft, 3 br house
% ====================== YOUR CODE HERE ======================
% Recall that the first column of Train_X is all-ones. Thus, it does
% not need to be normalized.
%a1=(1650 - mu(1,1)) / sigma(1,1);
%a2=(3    - mu(1,2)) / sigma(1,2);

%Model Test 
%price = [1, a1, a2]*theta; % You should change this
[m,n]=size(Test_data);
Test_X = Test_data(:,1:n-1);
Test_Y = Test_data(:,n);
[Test_X mu sigma] = featureNormalize(Test_X);

% Add intercept term to Train_X
Test_X = [ones(m, 1) Test_X];
Predicted_Y = Test_X * theta;



%Predicted_Y = [1 Test_X]*theta; % You should change this
%price = 0; % You should change this


% ============================================================

%fprintf('Predicted_Y :\n $%f\n', Predicted_Y );

     
%fprintf('Y: \n $%f\n', Test_Y );
%fprintf('Program paused. Press enter to continue.\n');

%Predication error calculation
temp=(norm(Predicted_Y' - Test_Y))^2;
model_error = (temp) / length(Test_Y);
%%%pause;

%% ================ Part 3: Normal Equations ================

%fprintf('Solving with normal equations...\n');

% ====================== YOUR CODE HERE ======================
% Instructions: The following code computes the closed form 
%               solution for linear regression using the normal
%               equations. You should complete the code in 
%               normalEqn.m
%
%               After doing so, you should complete this code 
%               to predict the price of a 1650 sq-ft, 3 br house.
%

%% Load Data
%{
data = csvread('ex1data2.txt');
Train_X = data(:, 1:2);
Train_Y = data(:, 3);
m = length(Train_Y);

[Train_X mu sigma] = featureNormalize(Train_X);

% Add intercept term to Train_X
Train_X = [ones(m, 1) Train_X];

% Calculate the parameters from the normal equation
theta = normalEqn(Train_X, Train_Y);

% Display normal equation's result
fprintf('Theta computed from the normal equations: \n');
fprintf(' %f \n', theta);
fprintf('\n');


% Estimate the price of a 1650 sq-ft, 3 br house
% ====================== YOUR CODE HERE ======================
price = 0; % You should change this
a1=(1650 - mu(1,1)) / sigma(1,1);
a2=(3    - mu(1,2)) / sigma(1,2);
price = [1, a1, a2]*theta; % You should change this


% ============================================================

fprintf(['Predicted price of a 1650 sq-ft, 3 br house ' ...
         '(using normal equations):\n $%f\n'], price);
%}

end
