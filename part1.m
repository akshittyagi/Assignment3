inputFile = fopen('group20.txt');
inputs = textscan(inputFile, '%s %s');

X = rand(20,1);
Y = rand(20,1);

for i = 2:21
    X(i-1) = str2double(inputs{1}{5*i - 5});
    Y(i-1) = str2double(inputs{2}{5*i - 5});
end

learnRate = 1.0e-25;

%assuming second order polynomial

% sum = 0.0;
% x = X;
% a = rand(3,1);
% size = size(a);
% n = size(1);
% sum = sum + 20*a(1);
% for i = 2:n
%     sum = sum + sum(a(i)*x);
%     x = x.*X;
% end
% 
% order1error = loss1(X,Y);

% a = rand(3,1);
% Xsqr = X.*X;
% ones = ones(20,1);
% sum = zeros(20,1);
% for i = 1:20
%     sum(i) = a(1) + a(2)*X(i) + a(3)*Xsqr(i);
% end
% 



a = ones(9,1);
for i = 1:9
    a(i) = 5;
end

 for i = 1:10
     px = calcPolynomial(X,a);
     cost = calcCost(px, Y);
     cost
     c = sum(cost);
     disp('current cost is');
     disp(c);
     disp('iteration number is');
     disp(i);
     grad = calcGrad(a, X, Y, px)
     for j = 1:length(a)
         a(j) = a(j) - learnRate*grad(j);
     end
     a
    % k = waitforbuttonpress;
 end
     
     
     
     
     
 