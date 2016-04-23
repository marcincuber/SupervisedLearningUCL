A = rand(6); % matrix of coefficients from Ax=b
b = rand(6,1); % right hand side
det(A); % determinant of A
% inverse = inv(A);  inverse of A
% x = inv(A)*b %#ok<MINV> % solves system, NOT recommended!

size(x), size(b), size(A)
x2 = A\b % better way to solve systems
spy(A) % sparsity plot: show nonzero elements
D = diag(1:6)
spy(D)
L = tril(A)
U = triu(A)
size(U), spy(U)