inputFile = fopen('group20.txt');
inputs = textscan(inputFile, '%s %s');

X = rand(20,1);
Y = rand(20,1);

for i = 2:21
    X(i-1) = str2double(inputs{1}{5*i - 5});
    Y(i-1) = str2double(inputs{2}{5*i - 5});
end
% for i = 2:101
%     X(i-1) = str2double(inputs{1}{i});
%     Y(i-1) = str2double(inputs{2}{i});
% end


xavg = sum(X)/20;
yavg = sum(Y)/20;
xstd = std(X);
ystd = std(Y);
for i = 1:length(X)
    X(i) = (X(i))/xstd;
    Y(i) = (Y(i))/ystd;
end
 
% polyfit(X,Y,9)

learnRate = 1.0e-6;
lambda = 0;

a = zeros(10,1);
% for i = 1:9
%     a(i) = 5;
% end

plotMat = zeros(1000,1);
 for i = 1:10000
     px = calcPolynomial(X,a);
     cost = calcCost(a, px, Y, lambda);
     cost
     c = sum(cost);
%      if i>99000
%         plotMat(i-9000) = c;
%      end
%      
     disp('current cost is');
     disp(c);
     disp('iteration number is');
     disp(i);
     grad = calcGrad(a, X, Y, px, lambda)
     for j = 1:length(a)
         a(j) = a(j) - learnRate*grad(j);
     end
     
    % k = waitforbuttonpress;
 end   
     
%  plot(plotMat); 
 for i = 1:length(a)
      a(i) = a(i)*ystd/(xstd^i);
 end
%   a


%NOISE VARIANCE
disp ('noise variance is ');
var(cost)

% Xtest = zeros(20,1);
% Ytest = zeros(20,1);
% for i = 1:20
%     Xtest(i) = str2double(inputs{1}{5*i - 2})/xstd;
%     Ytest(i) = str2double(inputs{2}{5*i - 2})/ystd;
% end
% 
% pxtest = calcPolynomial (Xtest,a);
% testcost = sum(calcCost(a, pxtest, Ytest, lambda))
     
%  Xcomp = zeros(100,1);
%  Ycomp = zeros(100,1);
%  for i = 2:101
%     X(i-1) = (str2double(inputs{1}{i}))/xstd;
%     Y(i-1) = (str2double(inputs{2}{i}))/ystd;
%  end
%  
% 
%  pxcomp = calcPolynomial(Xcomp, a);
%  totalcost = calcCost(a, pxcomp, Ycomp, lambda)