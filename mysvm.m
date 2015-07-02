h=x;
h(:,l<0)=-h(:,l<0);
options=optimset('Algorithm','interior-point-convex');
alpha=quadprog(h'*h,-ones(1,size(x,2)),[],[],l,0,...
    zeros(1,size(x,2)),[],[],options)';
w=sum(x.*(ones(size(x,1),1)*(l.*alpha)),2);
sv=alpha>1e-5;
isv=find(sv);
b=sum(w'*x(:,isv)-l(isv))/sum(sv);

figure
hold on
plot(x(1,find(l>0 & sv)),x(2,find(l>0 & sv)),'ro');
plot(x(1,find(l>0 & ~sv)),x(2,find(l>0 & ~sv)),'bo');
plot(x(1,find(l<0 & sv)),x(2,find(l<0 & sv)),'rx');
plot(x(1,find(l<0 & ~sv)),x(2,find(l<0 & ~sv)),'bx');
refline(-w(1)/w(2),(b+1)/w(2));
refline(-w(1)/w(2),(b-1)/w(2));
xlim([-1 1]);
ylim([-1 1]);
