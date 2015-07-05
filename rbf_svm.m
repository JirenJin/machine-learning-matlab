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
Q=l'*l*K;

options=optimset('Algorithm','interior-point-convex');
alpha=quadprog(Q,-ones(1,size(x,2)),[],[],l,0,...
    zeros(1,size(x,2)),C*ones(1,size(x,2)),[],options)';
f=sum(K.*(ones(size(x',1),1)*(l.*alpha)),2);
sv=alpha>1e-5;
isv=find(sv);
b=sum(f)/sum(sv) - l;

figure
hold on
plot(x(1,find(l>0 & sv)),x(2,find(l>0 & sv)),'ro');
plot(x(1,find(l>0 & ~sv)),x(2,find(l>0 & ~sv)),'bo');
plot(x(1,find(l<0 & sv)),x(2,find(l<0 & sv)),'rx');
plot(x(1,find(l<0 & ~sv)),x(2,find(l<0 & ~sv)),'bx');


xlim([-1 1]);
ylim([-1 1]);
