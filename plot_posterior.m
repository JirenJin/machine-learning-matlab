% Plot posterior distribution
% prior1 = 0.3; prior2 = 0.7

prior1 = 0.3;
prior2 = 0.7;

x = linspace(-5,10);
likelihood1 = inline('normpdf(x, 2, 1)', 'x');
likelihood2 = inline('normpdf(x, 4, 1)', 'x');

p_x = prior1 * likelihood1(x) + prior2 * likelihood2(x);

posterior1 = prior1 * likelihood1(x) ./ p_x;
posterior2 = prior2 * likelihood2(x) ./ p_x;

figure;
plot(x, posterior1, 'g', x, posterior2, 'r');
title('Posterior Distribution');
xlabel('x');
ylabel('Posterior Probability');