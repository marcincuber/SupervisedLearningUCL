function rtn = kridgereg(K,y,gamma)
%KRIDGEREG Summary of this function goes here
%   Detailed explanation goes here
    [msize,nsize] = size(K);
    inverse= (K + gamma*msize*eye(msize));
    alpha = mldivide(inverse,y);
    rtn = alpha;

end

