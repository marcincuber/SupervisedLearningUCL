function rtn = meansquares(x,y,w,size)
%MEAN squeares function
%x - matrix, y - vector, w - weight vector, size - height of the x matrix

rtn = 1/size * ((w' * x' * x * w) - (2 * y' * x * w) + (y' * y));

end

