function px = calcPolynomial(X,a)
size = length(a);
x = X;
px = ones(length(X),1);
a1 = a(1);
px = a1*px;
for i = 2:size
    for j = 1:length(px)
        ai = a(i);
        xj = x(j);
        px(j) = px(j) + ai*xj;
    end
    x = x.*X;
end

end