close all;
clc;
clear;

A = importdata('Data.txt');
X = A(:,1);
Y = A(:,2);

fprintf('Displaying data...\n');
scatter(X,Y);
fprintf('Press ENTER to continue...\n');
pause;
% Conducting fitting for less data points
% Will be increased to higher no. of data points at later time
M = 20;

[coefficients degree variance] = findPolynomial(X,Y,M);

