function cost = calcCost(a, px, Y, lambda)
%biquadratic cost function

c = (px - Y);%.*(px - Y);
for i = 1:3
    c = c.*(px-Y);
end

cost = c + lambda*sum(a.*a);


end
