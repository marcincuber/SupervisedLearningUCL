function rtn = kernel_compute(X_train,X_valid,sigma);

fold1_sigma_kernel = [];
%calculating kernel K(xtest, xval)
for i = 1:numel(X_train(:,1))
    kernel1 = [];
    for j = 1:numel(X_valid(:,1)) 
        kernel1 = [kernel1 gausskernel(X_train(i), X_valid(j), sigma)];
    end
    kerneltrans1 = kernel1';
    %ytest sum for gamma and alpha 1st value   
    fold1_sigma_kernel(:,i) = kerneltrans1;
    %ytest_sum_vector(i,1) = kernel_alpha; 
end

rtn = fold1_sigma_kernel;
end