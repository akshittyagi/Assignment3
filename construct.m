function Xmat = construct(X,degree)

Xmat = zeros(size(X,1),degree);

for i = 1:size(Xmat,1)
    x = X(i);
    product = x;
    for j = 1:size(Xmat,2)
        Xmat(i,j) = product;
        product = product*x;
    end
end
