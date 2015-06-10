mu1 = [0,0];
sigma1 = eye(2);
N = 300;
r1 = mvnrnd(mu1,sigma1,N);
mu2 = [3,0];
sigma2 = eye(2);
r2 = mvnrnd(mu2,sigma2,N);

figure
plot(r1(:,1),r1(:,2),'o',r2(:,1),r2(:,2),'x')


prior1 = 0.7;
prior2 = 0.3;
w = mu1 - mu2;
x0 = 1/2 * (mu1+mu2) - 1/norm(mu1-mu2) *log(prior1/prior2)*(mu1-mu2);
x0 = repmat(x0,N,1);
g1 = w * (r1 - x0)';
g1 = g1 > 0;
gscatter(r1(:,1),r1(:,2),g1,'br','xo')

hold on;
g2 = w * (r2 - x0)';
g2 = g2 > 0;
gscatter(r2(:,1),r2(:,2),g2,'br','ox')
