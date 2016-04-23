function rtn = ytest_compute(X_train, X_test, Y_train, gamma, sigma);


alpha_star = kridgereg((X_train*X_train'),Y_train,gamma);

ytest_sum_vector = [];
for i = 1:337
    kernel = [];
    for k = 1:1
        for j = 1:169   
            kernel = [kernel gausskernel(X_train(i), X_test(j), sigma)];
        end
        kerneltrans = kernel';
        kernel = [];
        sigma_kernel(:,k) = kerneltrans;
        %ytest sum for gamma and alpha 1st value
        kernel_alpha = sum(sigma_kernel * alpha_star(i));
            
    end
    ytest_sum_vector(i,1) = kernel_alpha;
    
end

rtn = ytest_sum_vector;
end

