clc;
close all;
clear;

[X,Y] = libsvmread('ncrna_train.txt');
[X1,Y1] = libsvmread('ncrna_test.txt');


svmTrainedData = svmtrain(X,Y);
[predicted_label, accuracy, prob_estimates] = svmpredict(X1,Y1,svmTrainedData);


%fprintf('\nTraining Set Accuracy: %f\n', mean(double(predicted_label==X)) * 100);
