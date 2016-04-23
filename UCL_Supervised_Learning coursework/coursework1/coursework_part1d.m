%part 1a 
%y is n x 1 vector
%w is m x 1 vector
%x is n x m matrix for model
%n is n x 1 vector of effors

mean_training_sum = 0;
mean_test_sum = 0;
mean_training10_sum = 0;
mean_test10_sum = 0;
iterations = 200;

for i = 1:iterations
    nsize = 600;
    msize = 1;
    w = randn(msize,1)
    n = randn(nsize,1);
    X = randn(nsize,msize);
    y = X * w + n;
    test = (X(1:500,:));
    train = (X(501:end,:));
    trainy = y(501:end,:);
    testy = y(1:500,:);
    w1 = mldivide(train'*train,train')*trainy;
    mean_training = meansquares(train,trainy,w1,100);
    mean_test = meansquares(test,testy,w1,500);
    train10 = X(501:510,:);
    train10y = y(501:510,:);
    w10 = mldivide(train10'*train10,train10')*train10y;
    mean_train10 = meansquares(train10,train10y,w10,10);
    mean_test10 = meansquares(test,testy,w10,500);
    
    mean_training_sum = mean_training_sum + mean_training;
    mean_test_sum = mean_test_sum + mean_test;
    mean_training10_sum = mean_training10_sum + mean_train10;
    mean_test10_sum = mean_test10_sum + mean_test10;
    i = i + 1;
end

mean_trainingAVG = mean_training_sum/iterations
mean_testAVG = mean_test_sum/iterations
mean_training10AVG = mean_training10_sum/iterations
mean_test10AVG = mean_test10_sum/iterations
    


%part 1d table
f = figure('Position',[340 400 361 106]);
 
% % create the data
d = [mean_trainingAVG mean_testAVG; mean_training10AVG mean_test10AVG];
 
% % Create the column and row names in cell arrays 
cnames = {'training set averages','test set averages'};
rnames = {'100 elements','10 elements'};

% Create the uitable
t = uitable(f,'Data',d,'ColumnName',cnames,'RowName',rnames);

% Set width and height
t.Position(3) = t.Extent(3);
t.Position(4) = t.Extent(4);