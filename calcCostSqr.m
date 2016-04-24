function cost = calcCostSqr (a, px, Y, lambda)
%quadratic cost function
cost = (px - Y).*(px- Y) + lambda*sum(a.*a);
end
