function rtn = kernel_matrix(x1,x2,sigma)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
K = [];
[msize1, nsize1] = size(x1);
[msize2, nsize2] = size(x2);
for i = 1:msize1
    for j = 1:msize2
        initkernel = gausskernel(x1(i,:),x2(j,:),sigma);
        K(j,i) = initkernel;
    end
end
rtn = K;
end

