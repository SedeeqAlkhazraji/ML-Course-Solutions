function myk_fold = myk_fold(data,No_of_Folds)
%data=load('ex1data2.txt');
[N,n]=size(data);

%No_of_Folds=3

for Fold_Counter=1:No_of_Folds
    idx_test_start = int16(fix((Fold_Counter-1) * N /No_of_Folds +1));
    idx_test_end   = int16(fix( Fold_Counter *  N /No_of_Folds));
    idx_test = idx_test_start:idx_test_end;
    idx_train = [1:idx_test_start-1,idx_test_end+1:N(end)];

    train_data = data(idx_train,:);
    test_data = data(idx_test,:);
    test_R(Fold_Counter)= testmodel(train_data ,test_data );
end
    

%    Test_X = data(:, 1:2);
%    Test_Y = data(:, 3);
myk_fold = mean(test_R);
%multi_features_error_calc(Train_X, Train_Y, Test_X,Test_Y)

end