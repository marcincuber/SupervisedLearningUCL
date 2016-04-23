

% a = [ 0.8 0.1; 0.2 0.9 ];
% x = [ 1; 0 ];
% for i = 1:20, x = a*x, end

t = 0:.3:10;
y = sin(t);
%plot(t,y)

% z(x,y) = x exp( - x^2 - y^2):
[x,y] = meshgrid(-2:.1:2, -2:.1:2);
z = x .* exp(-x.^2 - y.^2);
% surf(x,y,z)

a = [1 2];
b = [1 4 8];
c = conv(a,b)

s = tf('s')
polynomial = s^4 + 3*s^3 - 15*s^2 - 2*s + 9


B = [1 2 3 4; 5 6 7 8; 9 10 11 12];
C = B';
E = [1 2; 3 4];
F = [2 3; 4 5];
G = E .* F;

INV_E = inv(E);
eigen_E = eig(E);
poly_E = poly(E);

g = [1 2 3 4; 5 6 7 8; 9 10 11 12]
h = [1 1 1 1; 2 2 2 2; 3 3 3 3]
q = rand(3)
