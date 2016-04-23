%% exercise 9
%% part a
global mean_training_sum 
global mean_test_sum
global mean_training_values
global mean_test_values
%% Part b
global mean_train_sin_sum
global mean_test_sin_sum
global std_train_sin
global std_test_sin
mean_train_sin_sum = mean_train_sin_sum';
mean_test_sin_sum = mean_test_sin_sum';

%% Part c
global mean_training_all_sum
global mean_test_all_sum
global std_train_all
global std_test_all
%% exercise 10

global MSE_train_iterations
global MSE_test_iterations

string1_train = sprintf('%f ± %f',mean_training_sum/20, std2(mean_training_values));
string1_test = sprintf('%f ± %f',mean_test_sum/20, std2(mean_test_values));
string2_train = sprintf('%f ± %f',mean_train_sin_sum(1)/20, std2(std_train_sin(:,1)));
string2_test = sprintf('%f ± %f',mean_test_sin_sum(1)/20, std2(std_test_sin(:,1)));
string3_train = sprintf('%f ± %f',mean_train_sin_sum(2)/20, std2(std_train_sin(:,2)));
string3_test = sprintf('%f ± %f',mean_test_sin_sum(2)/20, std2(std_test_sin(:,2)));
string4_train = sprintf('%f ± %f',mean_train_sin_sum(3)/20, std2(std_train_sin(:,3)));
string4_test = sprintf('%f ± %f',mean_test_sin_sum(3)/20, std2(std_test_sin(:,3)));
string5_train = sprintf('%f ± %f',mean_train_sin_sum(4)/20, std2(std_train_sin(:,4)));
string5_test = sprintf('%f ± %f',mean_test_sin_sum(4)/20, std2(std_test_sin(:,4)));
string6_train = sprintf('%f ± %f',mean_train_sin_sum(5)/20, std2(std_train_sin(:,5)));
string6_test = sprintf('%f ± %f',mean_test_sin_sum(5)/20, std2(std_test_sin(:,5)));
string7_train = sprintf('%f ± %f',mean_train_sin_sum(6)/20, std2(std_train_sin(:,6)));
string7_test = sprintf('%f ± %f',mean_test_sin_sum(6)/20, std2(std_test_sin(:,6)));
string8_train = sprintf('%f ± %f',mean_train_sin_sum(7)/20, std2(std_train_sin(:,7)));
string8_test = sprintf('%f ± %f',mean_test_sin_sum(7)/20, std2(std_test_sin(:,7)));
string9_train = sprintf('%f ± %f',mean_train_sin_sum(8)/20, std2(std_train_sin(:,8)));
string9_test = sprintf('%f ± %f',mean_test_sin_sum(8)/20, std2(std_test_sin(:,8)));
string10_train = sprintf('%f ± %f',mean_train_sin_sum(9)/20, std2(std_train_sin(:,9)));
string10_test = sprintf('%f ± %f',mean_test_sin_sum(9)/20, std2(std_test_sin(:,9)));
string11_train = sprintf('%f ± %f',mean_train_sin_sum(10)/20, std2(std_train_sin(:,10)));
string11_test = sprintf('%f ± %f',mean_test_sin_sum(10)/20, std2(std_test_sin(:,10)));
string12_train = sprintf('%f ± %f',mean_train_sin_sum(11)/20, std2(std_train_sin(:,11)));
string12_test = sprintf('%f ± %f',mean_test_sin_sum(11)/20, std2(std_test_sin(:,11)));
string13_train = sprintf('%f ± %f',mean_train_sin_sum(12)/20, std2(std_train_sin(:,12)));
string13_test = sprintf('%f ± %f',mean_test_sin_sum(12)/20, std2(std_test_sin(:,12)));
string14_train = sprintf('%f ± %f',mean_train_sin_sum(13)/20, std2(std_train_sin(:,13)));
string14_test = sprintf('%f ± %f',mean_test_sin_sum(13)/20, std2(std_test_sin(:,13)));
string15_train = sprintf('%f ± %f',mean_training_all_sum/20, std2(std_train_all));
string15_test = sprintf('%f ± %f',mean_test_all_sum/20, std2(std_test_all));
string16_train = sprintf('%f ± %f',sum(MSE_train_iterations)/20, std2(MSE_train_iterations));
string16_test = sprintf('%f ± %f',sum(MSE_test_iterations)/20, std2(MSE_test_iterations));




% display table

% Create the column and row names in cell arrays 
cnames = {'Method', 'MSE train', 'MSE test'};
rnames = {'Naive Regression','Linear Regression (attribute 1)', 'Linear Regression (attribute 2)'...
    ,'Linear Regression (attribute 3)','Linear Regression (attribute 4)', 'Linear Regression (attribute 5)'...
    ,'Linear Regression (attribute 6)','Linear Regression (attribute 7)', 'Linear Regression (attribute 8)'...
    ,'Linear Regression (attribute 9)','Linear Regression (attribute 10)', 'Linear Regression (attribute 11)'...
    ,'Linear Regression (attribute 12)','Linear Regression (attribute 13)','Linear Regression (all attributes)'...
    'Kernel Ridge Regression'};
% create the data
d = {rnames{1}, string1_train, string1_test; rnames{2}, string2_train,string2_test;...
    rnames{3}, string3_train, string3_test; rnames{4}, string4_train, string4_test;...
    rnames{5}, string5_train, string5_test; rnames{6}, string6_train, string6_test;...
    rnames{7}, string7_train, string7_test; rnames{8}, string8_train, string8_test;...
    rnames{9}, string9_train, string9_test; rnames{10}, string10_train, string10_test;...
    rnames{11}, string11_train, string11_test; rnames{12}, string12_train, string12_test;...
    rnames{13}, string13_train, string13_test; rnames{14}, string14_train, string14_test;...
    rnames{15}, string15_train, string15_test; rnames{16}, string16_train, string16_test;};

% Create the uitable
f = figure('Position', [100 100 952 500]);

t = uitable('Parent', f, 'Position', [25 100 800 330], 'Data', d,'ColumnName',cnames,'RowName',rnames);
t.ColumnWidth = {180,300, 300};
t.RowName = [];
%t.BackgroundColor = [.4 .4 .4; .4 .4 .8];
%t.ForegroundColor = [1 1 1];