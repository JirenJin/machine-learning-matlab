% Soft-margin SVM

% C Control the number of misclassifed data point
C=100;  % The larger C is, the smaller the margin is.
sig=1;
n=size(x',1);
K=x'*x/sig^2;
d=diag(K);
K=K-ones(n,1)*d'/2;
K=K-d*ones(1,n)/2;
K=exp(K);
Q=l'*l.*K;

options=optimset('Algorithm','interior-point-convex');
alpha=quadprog(Q,-ones(1,size(x,2)),[],[],l,0,...
    zeros(1,size(x,2)),C*ones(1,size(x,2)),[],options)';

sv=alpha>1e-5;
isv=find(sv);

z = randn(2,1);
f = zeros(n,1);

x1 = linspace(-1,1);
x2 = linspace(-1,1);
[X1,X2] = meshgrid(x1,x2);
X1r = reshape(X1, 10000,1);
X2r = reshape(X2, 10000,1);

f = zeros(n*n, 1);

for i = 1:size(X1,1)^2
    z = [X1r(i);X2r(i)];
for index = 1:numel(isv)
    elm = isv(index);
    Kz = exp(-(x(:,elm) - z)' * (x(:,elm) - z) / (2*sig^2));
    tmp = alpha(elm)*l(elm)*Kz;
    f(i,1) = f(i,1)+tmp;
end
f(i,1) = f(i,1) + 1;
end

f = reshape(f, 100, 100);

%result = sign(f);
%sum(result == l')





%f=sum(K.*(ones(size(x',1),1)*(l.*alpha)),2);

% b=sum(f)/sum(sv) - l;

figure
hold on
plot(x(1,find(l>0 & sv)),x(2,find(l>0 & sv)),'ro');
plot(x(1,find(l>0 & ~sv)),x(2,find(l>0 & ~sv)),'bo');
plot(x(1,find(l<0 & sv)),x(2,find(l<0 & sv)),'rx');
plot(x(1,find(l<0 & ~sv)),x(2,find(l<0 & ~sv)),'bx');

contour(X1, X2, f, [-1 0 1])
xlim([-1 1]);
ylim([-1 1]);
