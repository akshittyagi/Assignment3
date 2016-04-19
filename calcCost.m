function cost = calcCost(px, Y)
%biquadratic cost function

c = (px - Y);%.*(px - Y);
for i = 1:3
    c = c.*(px-Y);
end

cost = c;


end
