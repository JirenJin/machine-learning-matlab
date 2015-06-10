mu1 = [8,8];
sigma1 = [1,-1.5;-1.5,3];
r1 = mvnrnd(mu1,sigma1,1000);
mu2 = [0,5];
sigma2 = [3,1.5;1.5,1];
r2 = mvnrnd(mu2,sigma2,1000);

% simultaneous diagnolization
[A, lambda] = eig(sigma1 \ sigma2);

mu1_Y = mu1 * A;
sigma1_Y = A' * sigma1 * A;
mu2_Y = mu2 * A;
sigma2_Y = A' * sigma2 * A;
r1_diag = r1 * A;
r2_diag = r2 * A;

% plot the results
figure
plot(r1(:,1),r1(:,2),'x',r2(:,1),r2(:,2),'+',r1_diag(:,1),r1_diag(:,2),'o',r2_diag(:,1),r2_diag(:,2),'.')
legend('Normal 1','Normal 2','Diag 1','Diag 2')
hold on;

% plot contour graph
x1 = -5:.2:15; x2 = -5:.2:15;
[X1,X2] = meshgrid(x1,x2);
F1 = mvnpdf([X1(:) X2(:)],mu1,sigma1);
F1 = reshape(F1,length(x2),length(x1));
F2 = mvnpdf([X1(:) X2(:)],mu2,sigma2);
F2 = reshape(F2,length(x2),length(x1));
F3 = mvnpdf([X1(:) X2(:)],mu1_Y,sigma1_Y);
F3 = reshape(F3,length(x2),length(x1));
F4 = mvnpdf([X1(:) X2(:)],mu2_Y,sigma2_Y);
F4 = reshape(F4,length(x2),length(x1));


contour(x1,x2,F1);
hold on;
contour(x1,x2,F2);
hold on;
contour(x1,x2,F3);
hold on;
contour(x1,x2,F4);