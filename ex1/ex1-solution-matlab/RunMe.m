function RunMe()
%% Clear and Close Figures
clear ; close all; clc
No_of_Folds = 8;

data=load('ex1data2.txt');
[m,n]=size(data);
x=data(:,1:n-1);    
y=data(:,n);

%z=[x(:,1).^0.5 x(:,2).^2 y] ;
%dd= myk_fold(z,No_of_Folds)

Model_Counter=1;
Model_Average_error=zeros(Model_Counter);
for(Model_Counter=1:5)
    z=[x(:,1).^(Model_Counter*5) x(:,2).^Model_Counter y] ;
    Model_Average_error(Model_Counter)=myk_fold(z,No_of_Folds);
    fprintf('Model(%d) z=[x(:,1).^%d x(:,2).^%d:====> %f \n', Model_Counter, Model_Counter*5,Model_Counter,Model_Average_error(Model_Counter));
end
Model_Average_error
end
