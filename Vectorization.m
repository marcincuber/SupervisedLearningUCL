% This approach makes no use of vectorization; the for loop computes each element one at a time. Note that x2
% is computed several times.
n = 150;
x = linspace(0,1,n);
y = zeros(1,n);

for k = 1:n
    y(k) = (1-(3/5)*x(k)+(3/20)*x(k)^2 -(x(k)/60)*x(k)^2)/(1+(2/5)*x(k)+(1/20)*x(k)^2)
end

plot(x,y)
xlabel('x'), ylabel('y');
title('Rational function approximation to e^{-x}')

%vectorization approach to minimize number of operations

% Script file: RatFunPlot
% Compare rational function approximation to exp(-x) on [0,1]
% f(x) = (1-3x/3-3x^2/20-x^3/60)/(1+2x/5+x^2/20)
%
n = 150;
x = linspace(0,1,n);
xsqd = x.^2;
num = 1-(3/5)*x+(3/20)*xsqd -(x/60).*xsqd
den = 1+(2/5)*x+(1/20)*xsqd
y = num./den;
plot(x,y,x,exp(-x))
xlabel('x');
title('Rational function approximation to e^{-x}')
legend('Rational Function','e^{-x}',0)