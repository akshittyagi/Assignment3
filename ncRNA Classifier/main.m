clc;
close all;
clear;

[X,Y] = libsvmread('ncrna_train.txt');
%%%%%%%%%% Cost vs Accuracy using cross validation sets %%%%%%%%%%%
ntrainingPoints = 0.6*size(X,1);
nvalidationPoints = size(X,1) - ntrainingPoints;

Xtrain = X(1:ntrainingPoints);
Xvalidate = X(ntrainingPoints+1:end);

Ytrain = Y(1:ntrainingPoints,:);
Yvalidate = Y(ntrainingPoints+1:end,:);

plotAccuracyvsCost(Xtrain,Ytrain,Xvalidate,Yvalidate,ntrainingPoints,nvalidationPoints);
%%%%%%%%%% Gaussian RBF Kernel %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
nCValidatePoints = 0.5*size(X,1);

XCValidate = X(1:nCValidatePoints);
XTrain = X(nCValidatePoints+1:end);

YCValidate = Y(1:nCValidatePoints,:);
YTrain = Y(nCValidatePoints+1:end,:);
C = 100;
sigma = 2;
Accuracy = fiveFoldCrossValidation(XCValidate,YCValidate,nCValidatePoints,C,sigma);
fprintf('\nComputing Cost and Sigma parameters for the RBF Kernel...\n');
pause;
%%%%%%%%%% Predicting on given test/predict data %%%%%%%%%%%%%%%%%%
[X1,Y1] = libsvmread('ncrna_test.txt');

svmTrainedData = svmtrain(X,Y,'-q -s 0 -t 0 -c 10 -h 0');
[predicted_labelsFromTraining] = svmpredict(X,Y,svmTrainedData);
[predicted_labelsFromTesting] = svmpredict(X1,Y1,svmTrainedData);

libsvmwrite('ncrna_test.txt',predicted_labelsFromTesting,Y1);
fprintf('\nTraining Set Accuracy: %f\n', mean(double(predicted_labelsFromTraining==X)) * 100);
