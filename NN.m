% preprocessing
mu = mean(x,2);
sigma = std(x,0,2);
x_sub = bsxfun(@minus, x, mu);
x_norm = bsxfun(@rdivide, x, sigma);
% add 1 bias
x_aug = [ones(1,n); x_norm];

% set learning hyperparameter
theta = 1;
learning_rate = 0.1;

% set # of hidden nodes
hidden_n = 15;

% initialization weights
w12 = randn(3, hidden_n) * 0.001;
w23 = randn(hidden_n + 1, 1) * 0.001;

while(true)
% forward pass
z2 = w12' * x_aug;
a2 = sigmoid(z2);
% add bias
a2 = [ones(1,n); a2];
z3 = w23' * a2;
a3 = sigmoid(z3);

% backward pass
% logical ground truth
l = l == 1;
epsilo3 = (a3 - l) .* a3 .* (1 - a3);
update23 = -learning_rate * epsilo3 * a2' ./ n;
epsilo2 = w23 * epsilo3 .* a2 .* (1 - a2);
epsilo2 = epsilo2(2:end, :);
update12 = -learning_rate * epsilo2 * x_aug' ./n;
w12 = w12 + update12';
w23 = w23 + update23';

% compute cost function
J = 1/2 * sum((a3 - l).^2)
if J < theta
    break;
end

end

% predict
% forward pass
z2 = w12' * x_aug;
a2 = sigmoid(z2);
a2 = [ones(1,n); a2];

z3 = w23' * a2;
a3 = sigmoid(z3);

% round a3 to 0,1
result = round(a3);

% number of correct classifications
sum(result == l)

% mean of accuracy
mean(result == l)
