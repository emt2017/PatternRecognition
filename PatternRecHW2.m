clc
load mnist_all.mat

%Pseudoinverse solution of mnist data for 2 and 3
tic
n = 5000;
data2 = [train2(1:n,:);train3(1:n,:);train4(1:n,:)];
label2 = [ones(n,1);-ones(n,1);-ones(n,1)];
aug_data2 =double([data2,ones(3*n,1)]);

w2 = aug_data2\label2;

%Testing of training data 22
check2 = aug_data2*w2 >= 0; 
check2 = check2 + (check2 - 1);
[check2 label2 check2 ~= label2]
Pct_error2 = sum(check2 ~= label2)/length(label2)*100

%Testing with test data
augtestdata2 = [[test2(1:900,:);test3(1:900,:);test4(1:900,:)],ones(2700,1)];
augtestdata2 = double(augtestdata2);  
check2 = augtestdata2*w2 >= 0; 
check2 = check2 + (check2 - 1);
labeltest2 = [ones(900,1);-ones(900,1);-ones(900,1)];
Pct_error2test = sum(check2 ~= labeltest2)/length(labeltest2)*100
toc
%///////////////////////////////////////////////////////
%Pseudoinverse solution of mnist data for 2 and 3
data3 = [train2(1:n,:);train3(1:n,:);train4(1:n,:)];
label3 = [-ones(n,1);ones(n,1);-ones(n,1)];
aug_data3 =double([data3,ones(3*n,1)]);

w3 = aug_data3\label3;

%Testing of training data 22
check3 = aug_data3*w3 >= 0; 
check3 = check3 + (check3 - 1);
[check3 label3 check3 ~= label3]
Pct_error3 = sum(check3 ~= label3)/length(label3)*100

%Testing with test data
augtestdata3 = [[test2(1:900,:);test3(1:900,:);test4(1:900,:)],ones(2700,1)];
augtestdata3 = double(augtestdata3);  
check3 = augtestdata3*w3 >= 0; 
check3 = check3 + (check3 - 1);
labeltest3 = [-ones(900,1);ones(900,1);-ones(900,1)];
Pct_error3test = sum(check3 ~= labeltest3)/length(labeltest3)*100
toc
%/////////////////////////////////////////////////////
%Pseudoinverse solution of mnist data for 2 and 3
data4 = [train2(1:n,:);train3(1:n,:);train4(1:n,:)];
label4 = [-ones(n,1);-ones(n,1);ones(n,1)];
aug_data4 =double([data4,ones(3*n,1)]);

w4 = aug_data4\label4;

%Testing of training data 22
check4 = aug_data4*w4 >= 0; 
check4 = check4 + (check4 - 1);
[check4 label4 check4 ~= label4]
Pct_error4 = sum(check4 ~= label4)/length(label4)*100

%Testing with test data
augtestdata4 = [[test2(1:900,:);test3(1:900,:);test4(1:900,:)],ones(2700,1)];
augtestdata4 = double(augtestdata4);  
check4 = augtestdata4*w4 >= 0; 
check4 = check4 + (check4 - 1);
labeltest4 = [-ones(900,1);-ones(900,1);ones(900,1)];
Pct_error4test = sum(check4 ~= labeltest4)/length(labeltest4)*100
toc

%final training % error
trainingError = [Pct_error2,Pct_error3,Pct_error4]
max(trainingError)

%final test % error
testError = [Pct_error2test,Pct_error3test,Pct_error4test]
max(testError)


