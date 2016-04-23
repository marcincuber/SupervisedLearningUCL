ones(3) % All ones
zeros(2,5) % All zeros
size(zeros(2,5))
size(g)
ones(size(g))
eye(4) % Identity matrix
eye(2,4)
eye(4,2)
rand(3) % Random elements uniformly distributed between 0 and 1
b = eye(3)
rand(size(b))
a = 1:4
diag(a)
diag(a,1)
diag(a,-2)

d = exp(1)
d*ones(3,4) % slowest
d+zeros(3,4) % slow
d(ones(3,4)) % faster
repmat(d,3,4) % fastest

g = [1 2 3 4; 5 6 7 8; 9 10 11 12]
g(3,2) % single element
g(:,2) % all rows, second column
g(2,:) % second row, all columns
g(1:2,:)
g(2,:) = [1 1 1 1] % replace row
g(:,2) = [2; 2; 2] % replace column