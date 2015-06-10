mu = mean(x,2);
sigma = std(x,0,2);
x_sub = bsxfun(@minus, x, mu);
x_norm = bsxfun(@rdivide, x, sigma);
x_aug = [ones(1,n); x_norm];

% initialize
w = randn(1, d+1) * 0.001;
learning_rate = 0.0001;
theta = 0.0001;
k = 0;

while(true)
    k = k + 1;
    y = w * x_aug;
    output = y .* l;
    mis = output < 0;
    grad = x_aug .* repmat(mis, 3, 1);
    grad = grad .* repmat(l, 3, 1);
    update = learning_rate * sum(grad,2);
    w = w + update';
    sum(mis)
    if abs(update) < theta
        break;
    end
    if k > 10000
        break;
    end
end

figure;
hold on;
plot(x_norm(1,find(l==1)),x_norm(2,find(l==1)),'o');
plot(x_norm(1,find(l==-1)),x_norm(2,find(l==-1)),'x');
Xax = -2:2;
Yax = -(w(1) + Xax.*w(2))/w(3);
ylim([-5,5]);
plot(Xax,Yax,'k--')
