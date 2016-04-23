%part 1a 
%y is n x 1 vector
%w is m x 1 vector
%x is n x m matrix for model
%n is n x 1 vector of effors

nsize = 600;
msize = 1;
w = randn(msize,1);
n = randn(nsize,1);
X = randn(nsize,msize);
y = X * w + n;
test = (X(1:500,:));
train = (X(501:end,:));
trainy = y(501:end,:);
testy = y(1:500,:);
%part 1b
%w = (X'X)^(-1)*X'y
% x = A\B or x = mldivide(A,B)
% 
% %new weights calculated for training and test data

w1 = mldivide(train'*train,train')*trainy
 
% %mean squares error on training and test data
mean_training = meansquares(train,trainy,w1,100)
mean_test = meansquares(test,testy,w1,500)

% %part 1c
train10 = X(501:510,:);
train10y = y(501:510,:);
w10 = mldivide(train10'*train10,train10')*train10y;
mean_train10 = meansquares(train10,train10y,w10,10)
mean_test10 = meansquares(test,testy,w10,500)

% %part 1d table
% f = figure('Position',[340 400 361 106]);
% 
% % create the data
% d = [mean_train10 mean_test10; mean_training mean_test];
% 
% % Create the column and row names in cell arrays 
% cnames = {'training set averages','test set averages'};
% rnames = {'100 elements','10 elements'};
% 
% % Create the uitable
% t = uitable(f,'Data',d,'ColumnName',cnames,'RowName',rnames);
% 
% % Set width and height
% t.Position(3) = t.Extent(3);
% t.Position(4) = t.Extent(4);