function [error , a] = curveFit(a,degree,X,Y,noOfIterations)

alpha = 1;
noOfTrainingPoints = size(X,1);
a = [1;
     a];
XMat = construct(X,degree);   
for i = 1:noOfIterations
    grad = a;
    h_y = calcPolynomial(X,a) - Y;
    grad(1) = grad(1) - alpha*(1/noOfTrainingPoints)*sum(h_y);
    h_y_xj = XMat'*h_y;  
    grad(2:end) = grad(2:end) - alpha*(1/noOfTrainingPoints)*h_y_xj;
    a = grad;
    mean(calcPolynomial(X,a)-Y)
    pause;
end

error = mean(calcPolynomial(X,a)-Y);

end