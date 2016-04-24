function grad = calcGradSqr (a, X, Y, px, lambda)
%quadratic cost function

for i = 1:length(a)
    for j = 1:length(X)
        rough(j) = (-1)*((Y(j) - px(j)))*(X(j)^(i-1));
    end
    grad(i) = sum(rough) + 2*lambda*a(i);
end

end