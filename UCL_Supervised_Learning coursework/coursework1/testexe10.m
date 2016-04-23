load boston;
y= boston(:,14);

[msize,nsize] = size(boston);
rows = ceil(msize/3);

gamma_range = 2.^(-40:-26);
gamma_vals = numel(gamma_range);
sigma_range = 2.^(7:0.5:13);
sigma_vals = numel(sigma_range);

%random split of the data set into training and test set
X = boston(:,1:13);
Xtrans = X';
[m,n] = size(Xtrans);
%y- dependent variable in column 14
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

%random splits of data into train and test sets
Y_train = Y_initr';
Y_test = Y_inite';
X_train = X_initr';
X_test = X_inite';


%kernel matrix
%5-fold split on training set
 [msizetrain,nsizetrain] = size(X_train);
 rows_5fold = ceil(msizetrain/5);

train1 = X_train(1:rows_5fold,1:13);
train2 = X_train(rows_5fold+1:2*rows_5fold,1:13);
train3 = X_train(2*rows_5fold+1:3*rows_5fold-1,1:13);
train4 = X_train(3*rows_5fold:4*rows_5fold-2,1:13);
train5 = X_train(4*rows_5fold-1:5*rows_5fold-3,1:13);

train1y = Y_train(1:rows_5fold,:);
train2y = Y_train(rows_5fold+1:2*rows_5fold,:);
train3y = Y_train(2*rows_5fold+1:3*rows_5fold-1,:);
train4y = Y_train(3*rows_5fold:4*rows_5fold-2,:);
train5y = Y_train(4*rows_5fold-1:5*rows_5fold-3,:);

error_matrix_fold1 = [];
error_matrix_fold2 = [];
error_matrix_fold3 = [];
error_matrix_fold4 = [];
error_matrix_fold5 = [];

%%calculating MSE for all pairings of gamma and sigma
% iterate over sigmas
for i = 1:sigma_vals 
    %% Mean Squared error calculation for Fold 1
    % train5 is used as test set
    fold1 = [train1;train2;train3;train4]; 
    fold1y = [train1y;train2y;train3y;train4y];
    
    %K = X_train * X_train';
    Ktrain_train_fold1 = kernel_matrix(fold1,fold1,sigma_range(i));
    % calculating kernel K(xi, xtest)  
    Ktrain_test_fold1 = kernel_matrix(fold1,train5,sigma_range(i));
    
    %% Mean Squared error calculation for Fold 2
    % train4 is used as test set
    fold2 = [train1;train2;train3;train5]; 
    fold2y = [train1y;train2y;train3y;train5y];

    %K = X_train * X_train';
    Ktrain_train_fold2 = kernel_matrix(fold2,fold2,sigma_range(i));
    % calculating kernel K(xi, xtest) 
    Ktrain_test_fold2 = kernel_matrix(fold2,train4,sigma_range(i));
    
    %% Mean Squared error calculation for Fold 3
    % train3 is used as test set
    fold3 = [train1;train2;train4;train5]; 
    fold3y = [train1y;train2y;train4y;train5y];

    %K = X_train * X_train';
    Ktrain_train_fold3 = kernel_matrix(fold3,fold3,sigma_range(i));
    % calculating kernel K(xi, xtest) 
    Ktrain_test_fold3 = kernel_matrix(fold3,train3,sigma_range(i));

    %% Mean Squared error calculation for Fold 4
    % train2 is used as test set
    fold4 = [train1;train3;train4;train5]; 
    fold4y = [train1y;train3y;train4y;train5y];

    %K = X_train * X_train';
    Ktrain_train_fold4 = kernel_matrix(fold4,fold4,sigma_range(i));
    % calculating kernel K(xi, xtest) 
    Ktrain_test_fold4 = kernel_matrix(fold4,train2,sigma_range(i));
            
    %% Mean Squared error calculation for Fold 5
    % train1 is used as test set
    fold5 = [train2;train3;train4;train5]; 
    fold5y = [train2y;train3y;train4y;train5y];

    %K = X_train * X_train';
    Ktrain_train_fold5 = kernel_matrix(fold5,fold5,sigma_range(i));
    % calculating kernel K(xi, xtest) 
    Ktrain_test_fold5 = kernel_matrix(fold5,train1,sigma_range(i));

    
    %iterate over gammas
    for j = 1:gamma_vals

        %% Mean Squared error calculation for Fold 1 cont
        % Compute alpha star for a single gamma value
        alpha_star1 = kridgereg(Ktrain_train_fold1,fold1y,gamma_range(j));

        % mean squared error calculation
        mean_error_fold1 = dualcost(Ktrain_test_fold1,train5y,alpha_star1);
        error_matrix_fold1(i,j) = mean_error_fold1;

        %% Mean Squared error calculation for Fold 2 cont
        % Compute alpha star for a single gamma value
        alpha_star2 = kridgereg(Ktrain_train_fold2,fold2y,gamma_range(j));

        % mean squared error calculation
        mean_error_fold2 = dualcost(Ktrain_test_fold2,train4y,alpha_star2);
        error_matrix_fold2(i,j) = mean_error_fold2;

        %% Mean Squared error calculation for Fold 3 cont
        % Compute alpha star for a single gamma value
        alpha_star3 = kridgereg(Ktrain_train_fold3,fold3y,gamma_range(j));

        % mean squared error calculation
        mean_error_fold3 = dualcost(Ktrain_test_fold3,train3y,alpha_star3);
        error_matrix_fold3(i,j) = mean_error_fold3;

        %% Mean Squared error calculation for Fold 4 cont
        % Compute alpha star for a single gamma value
        alpha_star4 = kridgereg(Ktrain_train_fold4,fold4y,gamma_range(j));

        % mean squared error calculation
        mean_error_fold4 = dualcost(Ktrain_test_fold4,train2y,alpha_star4);
        error_matrix_fold4(i,j) = mean_error_fold4;

        %% Mean Squared error calculation for Fold 5 cont
        % Compute alpha star for a single gamma value
        alpha_star5 = kridgereg(Ktrain_train_fold5,fold5y,gamma_range(j));
        
        % mean squared error calculation
        mean_error_fold5 = dualcost(Ktrain_test_fold5,train1y,alpha_star5);
        error_matrix_fold5(i,j) = mean_error_fold5;

    end
end

%averaged errors from all folds matrix of size 13x15
%13=rows=sigmas 15=columns=gammas
average_error_matrix =  (error_matrix_fold5 + error_matrix_fold4 + error_matrix_fold3 + error_matrix_fold2 + error_matrix_fold1) /5;

surf(average_error_matrix);
surf(log(average_error_matrix))

%find minimum entry
[minval,ind] = min(average_error_matrix(:));
%index values for a minimum error related to a pair (sigma,gamma)
[mins,ming] = ind2sub([size(average_error_matrix,1) size(average_error_matrix,2)],ind);
average_error_matrix(mins,ming); % this is minimum value

%calculating MSE on the training and test using min values of simga and gamma
%Y_train
%Y_test
%X_train
%X_test

K_train_train_main = kernel_matrix(X_train,X_train,sigma_range(mins));
K_train_test_main = kernel_matrix(X_train,X_test,sigma_range(mins));
alpha_start_main = kridgereg(K_train_train_main,Y_train,gamma_range(ming));
%MSE train
MSE_train_main = dualcost(K_train_train_main,Y_train,alpha_start_main)
MSE_test_main = dualcost(K_train_test_main,Y_test,alpha_start_main)
