function rtn = dualcost(K,y,alpha)
%DUALCOST Summary of this function goes here
%   Detailed explanation goes here
    [msize,nsize] = size(K);
    error = (1/msize) * ((K * alpha - y)' * (K * alpha - y));
    rtn = error;

end

