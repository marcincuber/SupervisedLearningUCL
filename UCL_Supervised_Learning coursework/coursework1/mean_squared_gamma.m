function rtn=mean_squared_gamma(x,y,gamma,msize)

    inverse = ((x' * x) + (gamma * msize * eye(msize)));
    w1 = mldivide(inverse,x'* y);
    rtn = meansquares(x,y,w1,msize);

end

