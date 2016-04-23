function rtn = gausskernel(x1, x2, sigma)
%GAUSSKERNEL Summary of this function goes here
%   Detailed explanation goes here
    x1 = x1(:); x2 = x2(:);

%   sim = gaussianKernel(x1, x2) returns a gaussian kernel between x1 and x2
%   and returns the value in sim
    xny = x1-x2;
    Normxny = xny'*xny;
    rtn = exp(-Normxny/(2*sigma^2));

end

