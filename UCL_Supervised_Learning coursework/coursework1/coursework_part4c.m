%part a
nsize = 600;
msize = 10;
w = randn(msize,1);
n = randn(nsize,1);
X = randn(nsize,msize);
y = X * w + n;
gamma_range = logspace(-6,3,10);

test = (X(1:500,:));
train = (X(501:end,:));

trainy = y(501:end,:);
testy = y(1:500,:);

mean_training_sum = 0;
mean_test_sum = 0;
mean_training10_sum = 0;
mean_test10_sum = 0;
iterations = 200;


for i = 1:iterations
    train_mean = [];
    test_mean = [];
    w100 = [];
    for i = 1:msize
        inverse = ((train' * train) + (gamma_range(i) * msize * eye(msize)));
        w100 = [w100 mldivide(inverse,train'* trainy)];
        train_mean = [train_mean meansquares(train,trainy,w100(:,i),msize)];
        test_mean = [test_mean meansquares(test,testy,w100(:,i),msize)];
    end
    % figure
    % subplot(2,2,1);loglog(gamma_range,train_mean,'-s');grid on;title('Training Set Mean Squared Error');
    % subplot(2,2,2);loglog(gamma_range,test_mean,'-s');grid on;title('Test Set Mean Squared Error');
    % 
    % subplot(2,2,3);loglog(gamma_range,train_mean,'-s');hold on; loglog(gamma_range,test_mean,'-s'); title('Training and Test Set Error');

    % part b 10 training samples
    train_mean10 = [];
    test_mean10 = [];
    train10 = X(501:510,:);
    train10y = y(501:510,:);
    test10 = test;
    test10y = testy;
    w1 = [];


    for i = 1:msize
            inverse = ((train10' * train10) + (gamma_range(i) * msize * eye(msize)));
            w1 = [w1 mldivide(inverse,train10'* train10y)];
            train_mean10 = [train_mean10 meansquares(train10,train10y,w1(:,i),msize)];
            test_mean10 = [test_mean10 meansquares(test10,test10y,w1(:,i),msize)];
    end


    % figure
    % subplot(2,1,1);loglog(gamma_range,train_mean10,'-s');grid on;title('sample size = 10, Training Set Mean Squared Error');
    % subplot(2,1,2);loglog(gamma_range,test_mean10,'-s');grid on;title('sample size = 10, Test Set Mean Squared Error');

    mean_training_sum = mean_training_sum + train_mean;
    mean_test_sum = mean_test_sum + test_mean;
    mean_training10_sum = mean_training10_sum + train_mean10;
    mean_test10_sum = mean_test10_sum + test_mean10;
end

mean_trainingAVG = mean_training_sum/iterations;
mean_testAVG = mean_test_sum/iterations;
mean_training10AVG = mean_training10_sum/iterations;
mean_test10AVG = mean_test10_sum/iterations;

figure
subplot(4,1,1);loglog(gamma_range,mean_trainingAVG,'-s');grid on;title('sample size = 100, Training Set Mean Squared Error');
subplot(4,1,2);loglog(gamma_range,mean_testAVG,'-s');grid on;title('sample size = 100, Test Set Mean Squared Error');
subplot(4,1,3);loglog(gamma_range,mean_training10AVG,'-s');grid on;title('sample size = 10, Training Set Mean Squared Error');
subplot(4,1,4);loglog(gamma_range,mean_test10AVG,'-s');grid on;title('sample size = 10, Test Set Mean Squared Error');




