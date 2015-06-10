d=2;
n=100;
x=2*rand(d,n)-[1;1]*ones(1,n);
l=2*((2*x(1,:)+x(2,:))>0.5)-1;
figure
hold on
plot(x(1,find(l==1)),x(2,find(l==1)),'o');
plot(x(1,find(l==-1)),x(2,find(l==-1)),'x');
