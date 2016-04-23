x = [3 4 7 11] % create a row vector (spaces)
x = 3:8 % colon generates list; default stride 1
x = 8:-1:0 % start : stride : stop specifies list
xx = [ 8 7 6 5 4 3 2 1 0]; % same as last; semicolon suppresses output
xx % display contents
x = linspace(0,1,11) % generate vector automatically
x = 0:0.1:1 % same thing
y = linspace(0,1); % note semicolon!
length(x)
length(y)
size(x)
size(y)
y(3) % access single element
y(1:12) % access first twelve elements
y([3 6 9 12]); % access values specified in a vector!
transpose = x' % transpose
z = [ 1+2*1i 4-3*1i ]
trans = z'
trans2 = z.' % note difference in transposes!
vecotr = 3*[1 2 5] % factor replicated, multiplies each element