function grad = calcGrad(a, X, Y, px)
%biquadratic cost
grad = zeros(length(a), 1);
rough = ones(length(X),1);

% for i = 1:length(a)
%     for j = 1:length(X)
%         rough(j) = (-1)*((Y(j) - px(j)))*(X(j)^(i-1));
%     end
%     grad(i) = sum(rough);
% end

for i = 1:length(a)
    for j = 1:length(X)
        rough(j) = (-4)*((Y(j) - px(j))^3)*(X(j)^(i-1));
    end
    grad(i) = sum(rough);
end


end