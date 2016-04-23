%% Exercise 5 - Tuning the regularisation parameter using a validation set

%% Part a

% currentSeed = 1;
% s = RandStream('mt19937ar','Seed',currentSeed);
% RandStream.setGlobalStream(s);
% 


nsize = 600;
msize = 10;

% Initialise random weight, noise and data points
w = randn(msize,1);
n = randn(nsize,1);
X = randn(nsize,msize);

% Calculate corresponding y values
y = X * w + n;

% Create values for our regularisation parameter
gamma_range = logspace(-6,3,msize);

% 200 iterations
iterations = 200;

% Partition data into training and test sets of size 500 and 100 resp. 
test = (X(1:500,:));
train = (X(501:end,:));

% Partition the y values such that correspond with the splits above
trainy = y(501:end,:);
testy = y(1:500,:);


X_tran_train = train';
Y_tran_train = trainy';

% Create a Validation set from the Training set
% T = train;
% Y = trainy;

% Choose random rows of data points
% num_points = size(X_tran_train,2);
% split_point = round(num_points* 0.8);
% seq = randperm(num_points);
% X_initr = X_tran_train(:, seq(1:split_point));
% X_inite = X_tran_train(:, seq(split_point+1:end));
% 
% Y_initr = Y_tran_train(:, seq(1:split_point));
% Y_inite = Y_tran_train(:, seq(split_point+1:end));
% 
% TrainSet = X_initr';
% ValidSet = X_inite';
% TrainSety = Y_initr';
% ValidSety = Y_inite';

% initialise sums = 0 to calculate average over number of runs
train_mean_sum = 0;
valid_mean_sum = 0;
test_mean_sum = 0;

% Initialise Gamma avg to 0, to calculate average gamma ~ min MSE
gamma_avg = 0;

for i = 1:iterations
    num_points = size(X_tran_train,2);
    split_point = round(num_points* 0.8);
    seq = randperm(num_points);
    X_initr = X_tran_train(:, seq(1:split_point));
    X_inite = X_tran_train(:, seq(split_point+1:end));

    Y_initr = Y_tran_train(:, seq(1:split_point));
    Y_inite = Y_tran_train(:, seq(split_point+1:end));

    TrainSet = X_initr';
    ValidSet = X_inite';
    TrainSety = Y_initr';
    ValidSety = Y_inite';
    
    % training set size 80
    train_mse = [];
    % validation set size 20, used to calculate weight vector
    valid_mse = [];
    % test set size 500
    test_mse = [];
    % weight vector
    w1 = [];
    
    % For each value of gamma, calculate mean squared error of each set
    for i = 1:msize
            inverse1 = ((TrainSet' * TrainSet) + (gamma_range(i) * 20 * eye(msize)));
            w1 = [w1 mldivide(inverse1,TrainSet'* TrainSety)];
            
            valid_mse = [valid_mse meansquares(ValidSet, ValidSety,w1(:,i),20)];
%             train_mse = [train_mse meansquares(TrainSet,TrainSety,w1(:,i),20)];
%             test_mse = [test_mse meansquares(test, testy,w1(:,i),500)];
    end
    
    % sum mean squared errors over each iteration
    train_mean_sum = train_mean_sum + train_mse;
    valid_mean_sum = valid_mean_sum + valid_mse;
    test_mean_sum = test_mean_sum + test_mse;
    
    % Select gamma ~ minimum MSE
    [M,I] = min(valid_mse);
    gamma_avg = gamma_avg + gamma_range(I);
end

% Calculate averages of errors over no. iterations
train_mean_avg = train_mean_sum/iterations;
valid_mean_avg = valid_mean_sum/iterations;
test_mean_avg = test_mean_sum/iterations;

% Calculate average gamma value ~ minimum MSE
gamma_avg = gamma_avg/iterations;

%% Perform Ridge Regression on full training set
training100_mean = meansquares(train,trainy,w1(:,I),100)


%% Part b - Same with 8 and 2 training and validation samples resp.

% Create validation set from the training set
T10 = train(1:10,:);
newPermutation10 = randperm(10);
TrainSet10 = T(newPermutation10(1:8), :);
ValidSet10 = T(newPermutation10(9:end), :);

% Obtain corresponding y values
Y10 = trainy(1:10,:);
newPermutation10y = randperm(10);
TrainSety10 = Y(newPermutation10y(1:8), :);
ValidSety10 = Y(newPermutation10y(9:end), :);

% Initialise mean squared errors to calculate averages
train_mean_sum10 = 0;
valid_mean_sum10 = 0;
test_mean_sum10 = 0;
gamma_avg10 = 0;

for i = 1:iterations
    % training set size 8
    train_mean10 = [];
    % validation set size 2 to calculate weight vector
    valid_mean10 = [];
    % test set size 500
    test_mean10 = [];
    % weight vector
    w10 = [];
    
    % For each value of gamma, calculate mean squared error of each set
    for i = 1:msize
            inverse = ((ValidSet10' * ValidSet10) + (gamma_range(i) * msize * eye(msize)));
            w10 = [w10 mldivide(inverse,ValidSet10'* ValidSety10)];
            train_mean10 = [train_mean10 meansquares(TrainSet10,TrainSety10,w10(:,i),msize)];
            valid_mean10 = [valid_mean10 meansquares(ValidSet10, ValidSety10,w10(:,i),msize)];
            test_mean10 = [test_mean10 meansquares(test, testy,w10(:,i),msize)];  
    end
    
    % Select gamma ~ minimum MSE
    [M10,I10] = min(valid_mse);
    gamma_avg10 = gamma_avg10 + gamma_range(I10);
    
    % Summing mean squared errors at the end of each iteration
    train_mean_sum10 = train_mean_sum10 + train_mean10;
    valid_mean_sum10 = valid_mean_sum10 + valid_mean10;
    test_mean_sum10 = test_mean_sum10 + test_mean10;
end
% Calculate average mean squared errors over no. iterations
train_mean_avg10 = train_mean_sum10/iterations;
valid_mean_avg10 = valid_mean_sum10/iterations;
test_mean_avg10 = test_mean_sum10/iterations;

% Calculate average gamma ~ minimum MSE
gamma_avg10 = gamma_avg10/iterations;


%% Perform Ridge Regression on the full training set
training100_mean10 = meansquares(train,trainy,w10(:,I10),10)

%% Plot results
%%%%%%% FIX the Graph and enable later
% figure
% subplot(2,1,1);loglog(gamma_range,train_mean_avg,'-s',gamma_range,valid_mean_avg,':',gamma_range,test_mean_avg,'-o' );grid on;legend('y = MSE(x)','y = cos(x)');title('Training split 80:20');
subplot(2,2,1);loglog(gamma_range,valid_mean_avg,'-s');grid on;title('Training split 80:20');
% subplot(2,1,2);loglog(gamma_range,train_mean_avg10,'-s',gamma_range,valid_mean_avg10,':',gamma_range,test_mean_avg10,'-o');grid on;title('Training split 8:2');


%subplot(4,1,2);loglog(gamma_range,valid_mean_avg,'-s');grid on;title('Validation set Mean Squared Error');
%subplot(4,1,3);loglog(gamma_range,test_mean_avg,'-s');grid on;title('Test set Mean Squared Error');
%subplot(4,1,3);loglog(gamma_range,train_mean_main,'-s');grid on;title('Training Set Mean Squared Error size= 100');



