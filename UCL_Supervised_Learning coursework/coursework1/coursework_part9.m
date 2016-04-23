load boston;
[ms,ns] = size(boston);
iterations= 20;
% Part a- naive regression
global mean_training_sum 
global mean_test_sum
global mean_training_values 
global mean_test_values
mean_training_sum = 0;
mean_test_sum = 0;
mean_training_values = [];
mean_test_values = [];

% Part b
global mean_train_sin_sum
global mean_test_sin_sum
global std_train_sin
global std_test_sin
mean_train_sin_sum = zeros(1,13);
mean_test_sin_sum = zeros(1,13);
std_train_sin = [];
std_test_sin = [];

% Part c
global mean_training_all_sum
global mean_test_all_sum
global std_train_all
global std_test_all
mean_training_all_sum = 0;
mean_test_all_sum = 0;
std_train_all = [];
std_test_all = [];

for i = 1:iterations
    %gamma and sigma- log2 values
    gamma_range = 2.^(-40:-26);
    sigma_range = 2.^(7:0.5:13);
    %X- main matrix with 13 categories (each column)
    X = boston(:,1:13);
    Xtrans = X';
    [m,n] = size(Xtrans);
    %y- dependent variable in column 14
    y= boston(:,14);
    ytrans = y';

    %random split of the data into training and test set, horizontal split on
    %X'
    num_points = size(Xtrans,2);
    split_point = round(num_points*(2/3));
    seq = randperm(num_points);
    X_initr = Xtrans(:,seq(1:split_point));
    X_inite = Xtrans(:,seq(split_point+1:end));

    Y_initr = ytrans(seq(1:split_point));
    Y_inite = ytrans(seq(split_point+1:end));

    Y_train = Y_initr';
    Y_test = Y_inite';
    X_train = X_initr';
    X_test = X_inite';


    %vector of ones for test and train sets
    % get sizes
    [testsr,testsc] = size(X_test);
    [trainsr,trainsc] = size(X_train);
    % generate vectors of ones
    V_train = ones(trainsr,1);
    V_test = ones(testsr,1);
    %X_train2 = [V_train,X_train];
    
    w = mldivide(X_train'*X_train,X_train')*Y_train;
    %B = mldivide(X_train2'*X_train2,X_train2')*Y_train;
    mean_training = meansquares(X_train,Y_train,w,trainsr);
    mean_test = meansquares(X_test,Y_test,w,testsr);
    
    mean_training_sum = mean_training_sum + mean_training;
    mean_test_sum = mean_test_sum + mean_test;
    mean_training_values(i) = mean_training;
    mean_test_values(i) = mean_test;  
    
    w_sin = [];

    mean_training_sin = [];
    mean_test_sin = [];
   
    %part b- i represents each column which corresponds to category
    for j = 1:13
        X_train_sin = X_train(:, j);
        X_test_sin = X_test(:, j);
        X_train_sin(:,2) = V_train;
        X_test_sin(:,2) = V_test;
        
        w_sin = [w_sin mldivide(X_train_sin'*X_train_sin,X_train_sin')*Y_train];
        mean_training_sin = [mean_training_sin meansquares(X_train_sin,Y_train,w_sin(:,j),trainsr)];
        mean_test_sin = [ mean_test_sin meansquares(X_test_sin,Y_test,w_sin(:,j),testsr)];
    end
    std_train_sin(i,:) = mean_training_sin;
    std_test_sin(i,:) = mean_test_sin;

    mean_train_sin_sum = mean_train_sin_sum + mean_training_sin;
    mean_test_sin_sum = mean_test_sin_sum + mean_test_sin;
    
    %part c
    X_train_all = X_train;
    X_test_all = X_test;
    X_train_all(:,14) = V_train;
    X_test_all(:,14) = V_test;
    
    w_all = mldivide(X_train_all'*X_train_all,X_train_all')*Y_train;
    mean_training_all = meansquares(X_train_all,Y_train,w_all,trainsr);
    mean_test_all = meansquares(X_test_all,Y_test,w_all,testsr);
    
    mean_training_all_sum = mean_training_all_sum + mean_training_all;
    mean_test_all_sum = mean_test_all_sum + mean_test_all;
    std_train_all(i) = mean_training_all;
    std_test_all(i) = mean_test_all;
   
end
%part a averages
mean_training_ave = mean_training_sum/iterations;
mean_test_ave = mean_test_sum/iterations;
%part b averages
mean_train_sin_avg = mean_train_sin_sum/iterations;
mean_test_sin_avg = mean_test_sin_sum/iterations;
%part c averages
mean_train_all_avg = mean_training_all_sum/iterations;
mean_test_all_avg = mean_test_all_sum/iterations;

