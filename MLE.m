mu = mean(x,2);
sigma = std(x,0,2);
x_sub = bsxfun(@minus, x, mu);
x_norm = bsxfun(@rdivide, x, sigma);
x_aug = [ones(1,n); x_norm];

% initialize
w = randn(1, d+1) * 0.001;
learning_rate = 0.0001;
theta = 0.01;
k = 0;
i = 0;

while(true)
    k = mod(k, n) + 1; 
    y = w * x_aug(:,k);
    update = learning_rate * (y - l(k)) * x_aug(:,k);
    w = w - update';
    delta = w * x_aug - l;
    J = 1/2 * sum(delta' * delta);
    if J < theta
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
plot(Xax,Yax,'k--')
