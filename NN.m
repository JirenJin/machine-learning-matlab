<<<<<<< HEAD
% preprocessing
=======
>>>>>>> e5bc4428c20867bac16910a29c15655676031778
mu = mean(x,2);
sigma = std(x,0,2);
x_sub = bsxfun(@minus, x, mu);
x_norm = bsxfun(@rdivide, x, sigma);
<<<<<<< HEAD
% add 1 bias
x_aug = [ones(1,n); x_norm];

% set learning hyperparameter
theta = 1;
learning_rate = 0.1;

% set # of hidden nodes
hidden_n = 15;

% initialization weights
=======
x_aug = [ones(1,n); x_norm];

theta = 1;
learning_rate = 0.01;
hidden_n = 20;

>>>>>>> e5bc4428c20867bac16910a29c15655676031778
w12 = randn(3, hidden_n) * 0.001;
w23 = randn(hidden_n + 1, 1) * 0.001;

while(true)
% forward pass
z2 = w12' * x_aug;
a2 = sigmoid(z2);
<<<<<<< HEAD
% add bias
a2 = [ones(1,n); a2];
=======
a2 = [ones(1,n); a2];

>>>>>>> e5bc4428c20867bac16910a29c15655676031778
z3 = w23' * a2;
a3 = sigmoid(z3);

% backward pass
<<<<<<< HEAD
% logical ground truth
=======
%dz3 = (1 - z3) .* z3;
%dz2 = w23' * dz3;
%dw23 = z2 * dz3;
>>>>>>> e5bc4428c20867bac16910a29c15655676031778
l = l == 1;
epsilo3 = (a3 - l) .* a3 .* (1 - a3);
update23 = -learning_rate * epsilo3 * a2' ./ n;
epsilo2 = w23 * epsilo3 .* a2 .* (1 - a2);
epsilo2 = epsilo2(2:end, :);
update12 = -learning_rate * epsilo2 * x_aug' ./n;
w12 = w12 + update12';
w23 = w23 + update23';

<<<<<<< HEAD
% compute cost function
=======
>>>>>>> e5bc4428c20867bac16910a29c15655676031778
J = 1/2 * sum((a3 - l).^2)
if J < theta
    break;
end

end

% predict
<<<<<<< HEAD
% forward pass
=======

>>>>>>> e5bc4428c20867bac16910a29c15655676031778
z2 = w12' * x_aug;
a2 = sigmoid(z2);
a2 = [ones(1,n); a2];

z3 = w23' * a2;
a3 = sigmoid(z3);
<<<<<<< HEAD

% round a3 to 0,1
result = round(a3);

% number of correct classifications
sum(result == l)

% mean of accuracy
mean(result == l)
=======
result = round(a3);
sum(result == l)

>>>>>>> e5bc4428c20867bac16910a29c15655676031778
