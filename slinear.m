d=2;
n=500;
x=[randn(d,n/2)/4+[0.5;0.5]*ones(1,n/2) randn(d,n/2)/4-[0.5;0.5]*ones(1,n/2)];
l=2*(x(1,:)>0)-1;
figure
hold on
plot(x(1,find(l==1)),x(2,find(l==1)),'o');
plot(x(1,find(l==-1)),x(2,find(l==-1)),'x');
