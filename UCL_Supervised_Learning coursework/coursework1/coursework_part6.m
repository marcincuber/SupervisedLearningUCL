% Part 6

nsize = 600;
msize = 10;
w = randn(msize,1);
n = randn(nsize,1);
gamma_range = logspace(-6,3,10);

X = randn(nsize,msize);
y = X * w + n;
test = (X(1:500,:));
train = (X(501:end,:)); 
trainy = y(501:end,:);
testy = y(1:500,:);
 
w1 = [];
train_main_mse = [];
test_main_mse = [];
for i = 1:msize
    inverse = ((train' * train) + (gamma_range(i) * msize * eye(msize)));
    w1 = [w1 mldivide(inverse,train'* trainy)];
    train_main_mse = [train_main_mse meansquares(train,trainy,w1(:,i),msize)];
    test_main_mse = [test_main_mse meansquares(test,testy,w1(:,i),msize)];
end

% split training set into 5 folds
% X values
train1 = train(1:20,:);
train2 = train(21:40,:);
train3 = train(41:60,:);
train4 = train(61:80,:);
train5 = train(81:100,:);
% y values
train1y = trainy(1:20,:);
train2y = trainy(21:40,:);
train3y = trainy(41:60,:);
train4y = trainy(61:80,:);
train5y = trainy(81:100,:);

% We have k = 5, threfore we have 5 folds of our data
% Test1 = [train1,train2,train3,train4] % test on train5
fold1 = [train1;train2;train3;train4]; 
fold1y = [train1y;train2y;train3y;train4y];
wfold1 = [];
train5_mse = [];
for i = 1:msize
    inverse = ((fold1' * fold1) + (gamma_range(i) * msize * eye(msize)));
    wfold1 = [wfold1 mldivide(inverse,fold1'* fold1y)];
    train5_mse = [train5_mse meansquares(train5,train5y,wfold1(:,i),msize)];
end

% Test2 = [train1,train2,train3,train5] % test on train4
fold2 = [train1;train2;train3;train5]; 
fold2y = [train1y;train2y;train3y;train5y];
wfold2 = [];
train4_mse = [];
for i = 1:msize
    inverse = ((fold2' * fold2) + (gamma_range(i) * msize * eye(msize)));
    wfold2 = [wfold2 mldivide(inverse,fold2'* fold2y)];
    train4_mse = [train4_mse meansquares(train4,train4y,wfold2(:,i),msize)];

end

% Test3 = [train1,train2,train4,train5] % test on train3
fold3 = [train1;train2;train4;train5]; 
fold3y = [train1y;train2y;train4y;train5y];
wfold3 = [];
train3_mse = [];
for i = 1:msize
    inverse = ((fold3' * fold3) + (gamma_range(i) * msize * eye(msize)));
    wfold3 = [wfold3 mldivide(inverse,fold3'* fold3y)];
    train3_mse = [train3_mse meansquares(train3,train3y,wfold3(:,i),msize)];
end

% Test4 = [train1,train3,train4,train5] % test on train2
fold4 = [train1;train3;train4;train5]; 
fold4y = [train1y;train3y;train4y;train5y];
wfold4 = [];
train2_mse = [];
for i = 1:msize
    inverse = ((fold4' * fold4) + (gamma_range(i) * msize * eye(msize)));
    wfold4 = [wfold4 mldivide(inverse,fold4'* fold4y)];
    train2_mse = [train2_mse meansquares(train2,train2y,wfold4(:,i),msize)];
end

% Test5 = [train2,train3,train4,train5] % test on train1
fold5 = [train2;train3;train4;train5];
fold5y = [train2y;train3y;train4y;train5y];
wfold5 = [];
train1_mse = [];
for i = 1:msize
    inverse = ((fold5' * fold5) + (gamma_range(i) * msize * eye(msize)));
    wfold5 = [wfold5 mldivide(inverse,fold5'* fold5y)];
    train1_mse = [train1_mse meansquares(train1,train1y,wfold5(:,i),msize)];
end

trainavg = (train1_mse+train2_mse + train3_mse + train4_mse + train5_mse)/5;

% Part b exercise 6
% using training set of size= 10
trains10 = (X(501:510,:)); 
trainys10 = y(501:510,:);

w10 = [];
train_main_mse10 = [];
test_main_mse10 = [];

for i = 1:msize
    inverse10s = ((trains10' * trains10) + (gamma_range(i) * msize * eye(msize)));
    w10 = [w10 mldivide(inverse10s,trains10'* trainys10)];
    train_main_mse10 = [train_main_mse10 meansquares(trains10,trainys10,w10(:,i),msize)];
    test_main_mse10 = [test_main_mse10 meansquares(test,testy,w10(:,i),msize)];
end

% split training set of size 10 into 5 folds
% X values
train10 = train(1:2,:);
train20 = train(3:4,:);
train30 = train(5:6,:);
train40 = train(7:8,:);
train50 = train(9:10,:);
% y values 
train10y = trainy(1:2,:);
train20y = trainy(3:4,:);
train30y = trainy(5:6,:);
train40y = trainy(7:8,:);
train50y = trainy(9:10,:);

% We have k = 5, threfore we have 5 folds of our data
% Test1 = [train1,train2,train3,train4] % test on train5
fold10 = [train10;train20;train30;train40]; 
fold10y = [train10y;train20y;train30y;train40y];
wfold10 = [];
train5_mse10 = [];
for i = 1:msize
    inverse10 = ((fold10' * fold10) + (gamma_range(i) * msize * eye(msize)));
    wfold10 = [wfold10 mldivide(inverse10,fold10'* fold10y)];
    train5_mse10 = [train5_mse10 meansquares(train50,train50y,wfold10(:,i),msize)];
end

% Test2 = [train1,train2,train3,train5] % test on train4
fold20 = [train10;train20;train30;train50]; 
fold20y = [train10y;train20y;train30y;train50y];
wfold20 = [];
train4_mse10 = [];
for i = 1:msize
    inverse10 = ((fold20' * fold20) + (gamma_range(i) * msize * eye(msize)));
    wfold20 = [wfold20 mldivide(inverse10,fold20'* fold20y)];
    train4_mse10 = [train4_mse10 meansquares(train40,train40y,wfold20(:,i),msize)];

end

% Test3 = [train1,train2,train4,train5] % test on train3
fold30 = [train10;train20;train40;train50]; 
fold30y = [train10y;train20y;train40y;train50y];
wfold30 = [];
train3_mse10 = [];
for i = 1:msize
    inverse10 = ((fold30' * fold30) + (gamma_range(i) * msize * eye(msize)));
    wfold30 = [wfold30 mldivide(inverse10,fold30'* fold30y)];
    train3_mse10 = [train3_mse10 meansquares(train30,train30y,wfold30(:,i),msize)];
end

% Test4 = [train1,train3,train4,train5] % test on train2
fold40 = [train10;train30;train40;train50]; 
fold40y = [train10y;train30y;train40y;train50y];
wfold40 = [];
train2_mse10 = [];
for i = 1:msize
    inverse10 = ((fold40' * fold40) + (gamma_range(i) * msize * eye(msize)));
    wfold40 = [wfold40 mldivide(inverse10,fold40'* fold40y)];
    train2_mse10 = [train2_mse10 meansquares(train20,train20y,wfold40(:,i),msize)];
end

% Test5 = [train2,train3,train4,train5] % test on train1
fold50 = [train20;train30;train40;train50];
fold50y = [train20y;train30y;train40y;train50y];
wfold50 = [];
train1_mse10 = [];
for i = 1:msize
    inverse10 = ((fold50' * fold50) + (gamma_range(i) * msize * eye(msize)));
    wfold50 = [wfold50 mldivide(inverse10,fold50'* fold50y)];
    train1_mse10 = [train1_mse10 meansquares(train10,train10y,wfold50(:,i),msize)];
end

trainavg10 = (train1_mse10+train2_mse10 + train3_mse10+ train4_mse10 + train5_mse10)/5;

figure
subplot(4,1,1);loglog(gamma_range,trainavg,'-s');grid on;title('training folds average scores size=100');
subplot(4,1,2);loglog(gamma_range,train_main_mse,'-s');grid on;title('train set mean error scores size=100');
subplot(4,1,3);loglog(gamma_range,test_main_mse,'-s');grid on;title('test set mean error scores size=100');
subplot(4,1,4);loglog(gamma_range,trainavg,'-s',gamma_range,train_main_mse,':',gamma_range,test_main_mse,'-o'); grid on; title('training folds, train set and test set size=100'); 

figure  
subplot(4,1,1);loglog(gamma_range,trainavg10,'-s');grid on;title('training folds average scores size=10');
subplot(4,1,2);loglog(gamma_range,train_main_mse10,'-s');grid on;title('train set mean error scores size=10');
subplot(4,1,3);loglog(gamma_range,test_main_mse10,'-s');grid on;title('test set mean error scores size=10');
subplot(4,1,4);loglog(gamma_range,trainavg10,'-s',gamma_range,train_main_mse10,':',gamma_range,test_main_mse10,'-o'); grid on; title('training folds, train set and test set size=10'); 
  
    
    
    
    
    
