a = 4; b = -1; c = 1;
a > b % note that the output is a logical value
a < b
a >= b
mytest = (abs(b) == c) % parentheses optional but clearer
% Things get a little more complicated with arrays. Using the g and h from above, try out the following.
g = [1 2 3 4; 5 6 7 8; 9 10 11 12]
h = [3 3 4 4; 5 5 6 6; 7 7 8 8]
h >= g
g == h % note that the output is a logical value
bigger = (g >= h)
g(bigger)
% g([0 0 0 1; 1 1 1 1; 1 1 1 1]) % array argument not logical!

h >= g
p = ~(h >= g)
~p
(g == h) & (g > h)
(g == h) | (g > h)
g >= h