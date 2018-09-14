clc
clear all
close all 

load mnist_all.mat

X = [];

%stack 28x28 matrices/////////////////////////////////////////////////
[m,~] = size(test1);
totalMatrix1 = [];
totalMatrix2 = [];
totalMatrix3 = [];
for i = 1:m
   matrix = reshape(test1(i,:),28,28)';
   totalMatrix1 = cat(3,totalMatrix1,matrix);
end
[m,~] = size(test2);
for i = 1:m
   matrix = reshape(test2(i,:),28,28)';
   totalMatrix2 = cat(3,totalMatrix2,matrix);
end
[m,~] = size(test3);
for i = 1:m
   matrix = reshape(test3(i,:),28,28)';
   totalMatrix3 = cat(3,totalMatrix3,matrix);
end

%Create 5x3 matrix////////////////////////////////////////////////////////
H = [];

%Create Features for 1 ////////////////////////////////////////////////////
[~,~,n] = size(totalMatrix1);
avgMatrixF1 = [];
avgMatrixF2 = [];
avgMatrixF3 = [];
avgMatrixF4 = [];
avgMatrixF5 = [];
X1=[];

for i = 1:n
    matrixLogic = totalMatrix1(:,:,i)>0;
    avgMatrixF1(i) = sum(sum(matrixLogic));
    X1(1,i)= sum(sum(matrixLogic));
end
H(1,1) = mean(avgMatrixF1);
%Create Feature 2
for i = 1:n
    matrixLogic = totalMatrix1(1:14,1:14,i)>0;
    avgMatrixF2(i) = sum(sum(matrixLogic));
    X1(2,i)= sum(sum(matrixLogic));
end
H(1,2) = mean(avgMatrixF2);
%Create Feature 3
for i = 1:n
    matrixLogic = totalMatrix1(1:14,15:28,i)>0;
    avgMatrixF3(i) = sum(sum(matrixLogic));
    X1(3,i)= sum(sum(matrixLogic));
end
H(1,3) = mean(avgMatrixF3);
%Create Feature 4
for i = 1:n
    matrixLogic = totalMatrix1(15:28,1:14,i)>0;
    avgMatrixF4(i) = sum(sum(matrixLogic));
    X1(4,i)= sum(sum(matrixLogic));
end
H(1,4) = mean(avgMatrixF4);
%Create Feature 5
for i = 1:n
    matrixLogic = totalMatrix1(15:28,15:28,i)>0;
    avgMatrixF5(i) = sum(sum(matrixLogic));
    X1(5,i)= sum(sum(matrixLogic));
end
H(1,5) = mean(avgMatrixF5);

%Create Features for 2//////////////////////////////////////////////////
[~,~,n] = size(totalMatrix2);
avgMatrixF1 = [];
avgMatrixF2 = [];
avgMatrixF3 = [];
avgMatrixF4 = [];
avgMatrixF5 = [];
X2=[];
for i = 1:n
    matrixLogic = totalMatrix2(:,:,i)>0;
    avgMatrixF1(i) = sum(sum(matrixLogic));
    X2(1,i)= sum(sum(matrixLogic));
end
H(2,1) = mean(avgMatrixF1);
%Create Feature 2
for i = 1:n
    matrixLogic = totalMatrix2(1:14,1:14,i)>0;
    avgMatrixF2(i) = sum(sum(matrixLogic));
    X2(2,i)= sum(sum(matrixLogic));
end
H(2,2) = mean(avgMatrixF2);
%Create Feature 3
for i = 1:n
    matrixLogic = totalMatrix2(1:14,15:28,i)>0;
    avgMatrixF3(i) = sum(sum(matrixLogic));
    X2(3,i)= sum(sum(matrixLogic));
end
H(2,3) = mean(avgMatrixF3);
%Create Feature 4
for i = 1:n
    matrixLogic = totalMatrix2(15:28,1:14,i)>0;
    avgMatrixF4(i) = sum(sum(matrixLogic));
    X2(4,i)= sum(sum(matrixLogic));
end
H(2,4) = mean(avgMatrixF4);
%Create Feature 5
for i = 1:n
    matrixLogic = totalMatrix2(15:28,15:28,i)>0;
    avgMatrixF5(i) = sum(sum(matrixLogic));
    X2(5,i)= sum(sum(matrixLogic));
end
H(2,5) = mean(avgMatrixF5);

%Create Features for 3//////////////////////////////////////////////////
[~,~,n] = size(totalMatrix3);
avgMatrixF1 = [];
avgMatrixF2 = [];
avgMatrixF3 = [];
avgMatrixF4 = [];
avgMatrixF5 = [];
X3=[];
for i = 1:n
    matrixLogic = totalMatrix3(:,:,i)>0;
    avgMatrixF1(i) = sum(sum(matrixLogic));
    X3(1,i)= sum(sum(matrixLogic));
end
H(3,1) = mean(avgMatrixF1);
%Create Feature 2
for i = 1:n
    matrixLogic = totalMatrix3(1:14,1:14,i)>0;
    avgMatrixF2(i) = sum(sum(matrixLogic));
    X3(2,i)= sum(sum(matrixLogic));
end
H(3,2) = mean(avgMatrixF2);
%Create Feature 3
for i = 1:n
    matrixLogic = totalMatrix3(1:14,15:28,i)>0;
    avgMatrixF3(i) = sum(sum(matrixLogic));
    X3(3,i)= sum(sum(matrixLogic));
end
H(3,3) = mean(avgMatrixF3);
%Create Feature 4
for i = 1:n
    matrixLogic = totalMatrix3(15:28,1:14,i)>0;
    avgMatrixF4(i) = sum(sum(matrixLogic));
    X3(4,i)= sum(sum(matrixLogic));
end
H(3,4) = mean(avgMatrixF4);
%Create Feature 5
for i = 1:n
    matrixLogic = totalMatrix3(15:28,15:28,i)>0;
    avgMatrixF5(i) = sum(sum(matrixLogic));
    X3(5,i)= sum(sum(matrixLogic));
end
H(3,5) = mean(avgMatrixF5);
%Make your X
X = []
X = cat(2,X1,X2,X3);
%//////////////////////////END OF FEATURE Creation//////////////////////
imshow(totalMatrix3(:,:,10));
imshow(totalMatrix3(11:18,:,10))
imshow(totalMatrix3(1:14,1:14,10))
imshow(totalMatrix3(1:14,15:28,10))
imshow(totalMatrix3(15:28,1:14,10))
imshow(totalMatrix3(15:28,15:28,10))

matrixLogic = totalMatrix2(:,:,10)>0;
matrixLogic = totalMatrix3(1:14,1:14,8)>0;
%Proposed features 5 total
%1. sum of all white pixels
%2.3.4.5. Quarter the numbers sum pixels in each quadrant.
sum(sum(matrixLogic)) 
%See if you can find separated clusters using proposed features with K-means
%3x5 matrix with averages of train for each number in pixels?


%k_means
theta = H';
[theta,bel,J]=k_means(X,theta)
%Find Error
CorrectMatrix = cat(2,repmat(1,1,1135),repmat(2,1,1032),repmat(3,1,1010));
r1 = randi(3,1,3177)
err = immse(bel,CorrectMatrix)

PercentCorrect = sum(CorrectMatrix == bel)/3177
error = 1 - PercentCorrect

%stack 28x28 matrices/////////////////////////////////////////////////
[m,~] = size(train1);
totalMatrix1 = [];
totalMatrix2 = [];
totalMatrix3 = [];
for i = 1:m
   matrix = reshape(train1(i,:),28,28)';
   totalMatrix1 = cat(3,totalMatrix1,matrix);
end
[m,~] = size(train2);
for i = 1:m
   matrix = reshape(train2(i,:),28,28)';
   totalMatrix2 = cat(3,totalMatrix2,matrix);
end
[m,~] = size(train3);
for i = 1:m
   matrix = reshape(train3(i,:),28,28)';
   totalMatrix3 = cat(3,totalMatrix3,matrix);
end

%Create Features for 1 ////////////////////////////////////////////////////
[~,~,n] = size(totalMatrix1);
avgMatrixF1 = [];
avgMatrixF2 = [];
avgMatrixF3 = [];
avgMatrixF4 = [];
avgMatrixF5 = [];
X1t=[];

for i = 1:n
    matrixLogic = totalMatrix1(:,:,i)>0;
    avgMatrixF1(i) = sum(sum(matrixLogic));
    X1t(1,i)= sum(sum(matrixLogic));
end
H(1,1) = mean(avgMatrixF1);
%Create Feature 2
for i = 1:n
    matrixLogic = totalMatrix1(1:14,1:14,i)>0;
    avgMatrixF2(i) = sum(sum(matrixLogic));
    X1t(2,i)= sum(sum(matrixLogic));
end
H(1,2) = mean(avgMatrixF2);
%Create Feature 3
for i = 1:n
    matrixLogic = totalMatrix1(1:14,15:28,i)>0;
    avgMatrixF3(i) = sum(sum(matrixLogic));
    X1t(3,i)= sum(sum(matrixLogic));
end
H(1,3) = mean(avgMatrixF3);
%Create Feature 4
for i = 1:n
    matrixLogic = totalMatrix1(15:28,1:14,i)>0;
    avgMatrixF4(i) = sum(sum(matrixLogic));
    X1t(4,i)= sum(sum(matrixLogic));
end
H(1,4) = mean(avgMatrixF4);
%Create Feature 5
for i = 1:n
    matrixLogic = totalMatrix1(15:28,15:28,i)>0;
    avgMatrixF5(i) = sum(sum(matrixLogic));
    X1t(5,i)= sum(sum(matrixLogic));
end
H(1,5) = mean(avgMatrixF5);

%Create Features for 2//////////////////////////////////////////////////
[~,~,n] = size(totalMatrix2);
avgMatrixF1 = [];
avgMatrixF2 = [];
avgMatrixF3 = [];
avgMatrixF4 = [];
avgMatrixF5 = [];
X2t=[];
for i = 1:n
    matrixLogic = totalMatrix2(:,:,i)>0;
    avgMatrixF1(i) = sum(sum(matrixLogic));
    X2t(1,i)= sum(sum(matrixLogic));
end
H(2,1) = mean(avgMatrixF1);
%Create Feature 2
for i = 1:n
    matrixLogic = totalMatrix2(1:14,1:14,i)>0;
    avgMatrixF2(i) = sum(sum(matrixLogic));
    X2t(2,i)= sum(sum(matrixLogic));
end
H(2,2) = mean(avgMatrixF2);
%Create Feature 3
for i = 1:n
    matrixLogic = totalMatrix2(1:14,15:28,i)>0;
    avgMatrixF3(i) = sum(sum(matrixLogic));
    X2t(3,i)= sum(sum(matrixLogic));
end
H(2,3) = mean(avgMatrixF3);
%Create Feature 4
for i = 1:n
    matrixLogic = totalMatrix2(15:28,1:14,i)>0;
    avgMatrixF4(i) = sum(sum(matrixLogic));
    X2t(4,i)= sum(sum(matrixLogic));
end
H(2,4) = mean(avgMatrixF4);
%Create Feature 5
for i = 1:n
    matrixLogic = totalMatrix2(15:28,15:28,i)>0;
    avgMatrixF5(i) = sum(sum(matrixLogic));
    X2t(5,i)= sum(sum(matrixLogic));
end
H(2,5) = mean(avgMatrixF5);

%Create Features for 3//////////////////////////////////////////////////
[~,~,n] = size(totalMatrix3);
avgMatrixF1 = [];
avgMatrixF2 = [];
avgMatrixF3 = [];
avgMatrixF4 = [];
avgMatrixF5 = [];
X3t=[];
for i = 1:n
    matrixLogic = totalMatrix3(:,:,i)>0;
    avgMatrixF1(i) = sum(sum(matrixLogic));
    X3t(1,i)= sum(sum(matrixLogic));
end
H(3,1) = mean(avgMatrixF1);
%Create Feature 2
for i = 1:n
    matrixLogic = totalMatrix3(1:14,1:14,i)>0;
    avgMatrixF2(i) = sum(sum(matrixLogic));
    X3t(2,i)= sum(sum(matrixLogic));
end
H(3,2) = mean(avgMatrixF2);
%Create Feature 3
for i = 1:n
    matrixLogic = totalMatrix3(1:14,15:28,i)>0;
    avgMatrixF3(i) = sum(sum(matrixLogic));
    X3t(3,i)= sum(sum(matrixLogic));
end
H(3,3) = mean(avgMatrixF3);
%Create Feature 4
for i = 1:n
    matrixLogic = totalMatrix3(15:28,1:14,i)>0;
    avgMatrixF4(i) = sum(sum(matrixLogic));
    X3t(4,i)= sum(sum(matrixLogic));
end
H(3,4) = mean(avgMatrixF4);
%Create Feature 5
for i = 1:n
    matrixLogic = totalMatrix3(15:28,15:28,i)>0;
    avgMatrixF5(i) = sum(sum(matrixLogic));
    X3t(5,i)= sum(sum(matrixLogic));
end

%Make your X
Xt = []
Xt = cat(2,X1t,X2t,X3t);

%k-NN
CorrectMatrixT = cat(2,repmat(1,1,6742),repmat(2,1,5958),repmat(3,1,6132));
k = 3;
Z = Xt;
v = CorrectMatrixT';
X = X;

[z]=k_nn_classifier(Z,v,k,X)

PercentCorrect = sum(CorrectMatrix == z)/3177
error = 1 - PercentCorrect


%SVM Matlab function X1 vsX2:X3 1 against all
data_ =double( [X1t(:,1:1000)';X2t(:,1:1000)';X3t(:,1:1000)']);
class_ = [ones(1000,1);-ones(1000,1);-ones(1000,1)];

data_test =double( [X1(:,1:1000)';X2(:,1:1000)';X3(:,1:1000)']);
class_test = [ones(1000,1);-ones(1000,1);-ones(1000,1)];

SVMSTRUCT = svmtrain(data_', class_, 'boxconstraint',0.015);
guess = svmclassify(SVMSTRUCT,data_test);

SVMErr1 = sum(guess ~= class_test)/length(class_test) * 100

%X2 vs X1X3
data_ =double( [X1t(:,1:1000)';X2t(:,1:1000)';X3t(:,1:1000)']);
class_ = [-ones(1000,1);ones(1000,1);-ones(1000,1)];

data_test =double( [X1(:,1:1000)';X2(:,1:1000)';X3(:,1:1000)']);
class_test = [-ones(1000,1);ones(1000,1);-ones(1000,1)];

SVMSTRUCT = svmtrain(data_', class_, 'boxconstraint',0.015);
guess = svmclassify(SVMSTRUCT,data_test);

SVMErr2 = sum(guess ~= class_test)/length(class_test) * 100

%X3 vs X1X2
data_ =double( [X1t(:,1:1000)';X2t(:,1:1000)';X3t(:,1:1000)']);
class_ = [-ones(1000,1);-ones(1000,1);ones(1000,1)];

data_test =double( [X1(:,1:1000)';X2(:,1:1000)';X3(:,1:1000)']);
class_test = [-ones(1000,1);-ones(1000,1);ones(1000,1)];

SVMSTRUCT = svmtrain(data_', class_, 'boxconstraint',0.015);
guess = svmclassify(SVMSTRUCT,data_test);

SVMErr3 = sum(guess ~= class_test)/length(class_test) * 100

testError = [SVMErr1,SVMErr2,SVMErr3]
max(testError)

%imshow(totalMatrix1(:,:,10))
% one = test3(4,:);
% matrix = reshape(one,28,28)'>0;
% matrixPiece = matrix(9:20,:)
% %sum(one(:) > 0)
% sum(sum(matrixPiece)')
% imshow(matrix)
%need a 5x3 matrix
%l = 3 for each number
%N


% Sum Of Errors Squares classifier one against many
%Pseudoinverse solution of mnist data for 2 and 3
tic
n = 5000;
data2 = [train1(1:n,:);train2(1:n,:);train3(1:n,:)];
label2 = [ones(n,1);-ones(n,1);-ones(n,1)];
aug_data2 =double([data2,ones(3*n,1)]);

w2 = aug_data2\label2;

%Testing of training data 22
check2 = aug_data2*w2 >= 0; 
check2 = check2 + (check2 - 1);
[check2 label2 check2 ~= label2]
Pct_error2 = sum(check2 ~= label2)/length(label2)*100

%Testing with test data
augtestdata2 = [[test1(1:900,:);test2(1:900,:);test3(1:900,:)],ones(2700,1)];
augtestdata2 = double(augtestdata2);  
check2 = augtestdata2*w2 >= 0; 
check2 = check2 + (check2 - 1);
labeltest2 = [ones(900,1);-ones(900,1);-ones(900,1)];
Pct_error2test = sum(check2 ~= labeltest2)/length(labeltest2)*100
toc
%///////////////////////////////////////////////////////
%Pseudoinverse solution of mnist data for 2 and 3
data3 = [train1(1:n,:);train2(1:n,:);train3(1:n,:)];
label3 = [-ones(n,1);ones(n,1);-ones(n,1)];
aug_data3 =double([data3,ones(3*n,1)]);

w3 = aug_data3\label3;

%Testing of training data 22
check3 = aug_data3*w3 >= 0; 
check3 = check3 + (check3 - 1);
[check3 label3 check3 ~= label3]
Pct_error3 = sum(check3 ~= label3)/length(label3)*100

%Testing with test data
augtestdata3 = [[test1(1:900,:);test2(1:900,:);test3(1:900,:)],ones(2700,1)];
augtestdata3 = double(augtestdata3);  
check3 = augtestdata3*w3 >= 0; 
check3 = check3 + (check3 - 1);
labeltest3 = [-ones(900,1);ones(900,1);-ones(900,1)];
Pct_error3test = sum(check3 ~= labeltest3)/length(labeltest3)*100
toc
%/////////////////////////////////////////////////////
%Pseudoinverse solution of mnist data for 2 and 3
data4 = [train1(1:n,:);train2(1:n,:);train3(1:n,:)];
label4 = [-ones(n,1);-ones(n,1);ones(n,1)];
aug_data4 =double([data4,ones(3*n,1)]);

w4 = aug_data4\label4;

%Testing of training data 22
check4 = aug_data4*w4 >= 0; 
check4 = check4 + (check4 - 1);
[check4 label4 check4 ~= label4]
Pct_error4 = sum(check4 ~= label4)/length(label4)*100

%Testing with test data
augtestdata4 = [[test1(1:900,:);test2(1:900,:);test3(1:900,:)],ones(2700,1)];
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


%one against one pseudoinverse
%Pseudoinverse solution of mnist data for 2 and 3
tic
n = 5000;
data2 = [train1(1:n,:);train2(1:n,:)];
label2 = [ones(n,1);-ones(n,1)];
aug_data2 =double([data2,ones(2*n,1)]);

w2 = aug_data2\label2;

%Testing of training data 22
check2 = aug_data2*w2 >= 0; 
check2 = check2 + (check2 - 1);
[check2 label2 check2 ~= label2]
Pct_error2 = sum(check2 ~= label2)/length(label2)*100

%Testing with test data
augtestdata2 = [[test1(1:900,:);test2(1:900,:)],ones(1800,1)];
augtestdata2 = double(augtestdata2);  
check2 = augtestdata2*w2 >= 0; 
check2 = check2 + (check2 - 1);
labeltest2 = [ones(900,1);-ones(900,1)];
Pct_error2test = sum(check2 ~= labeltest2)/length(labeltest2)*100
toc
%///////////////////////////////////////////////////////
%Pseudoinverse solution of mnist data for 2 and 3
data3 = [train2(1:n,:);train3(1:n,:)];
label3 = [ones(n,1);-ones(n,1)];
aug_data3 =double([data3,ones(2*n,1)]);

w3 = aug_data3\label3;

%Testing of training data 22
check3 = aug_data3*w3 >= 0; 
check3 = check3 + (check3 - 1);
[check3 label3 check3 ~= label3]
Pct_error3 = sum(check3 ~= label3)/length(label3)*100

%Testing with test data
augtestdata3 = [[test2(1:900,:);test3(1:900,:)],ones(1800,1)];
augtestdata3 = double(augtestdata3);  
check3 = augtestdata3*w3 >= 0; 
check3 = check3 + (check3 - 1);
labeltest3 = [ones(900,1);-ones(900,1)];
Pct_error3test = sum(check3 ~= labeltest3)/length(labeltest3)*100
toc
%/////////////////////////////////////////////////////
%Pseudoinverse solution of mnist data for 2 and 3
data4 = [train1(1:n,:);train3(1:n,:)];
label4 = [-ones(n,1);ones(n,1)];
aug_data4 =double([data4,ones(2*n,1)]);

w4 = aug_data4\label4;

%Testing of training data 22
check4 = aug_data4*w4 >= 0; 
check4 = check4 + (check4 - 1);
[check4 label4 check4 ~= label4]
Pct_error4 = sum(check4 ~= label4)/length(label4)*100

%Testing with test data
augtestdata4 = [[test1(1:900,:);test3(1:900,:)],ones(1800,1)];
augtestdata4 = double(augtestdata4);  
check4 = augtestdata4*w4 >= 0; 
check4 = check4 + (check4 - 1);
labeltest4 = [-ones(900,1);ones(900,1)];
Pct_error4test = sum(check4 ~= labeltest4)/length(labeltest4)*100
toc

%final training % error
trainingError = [Pct_error2,Pct_error3,Pct_error4]
max(trainingError)

%final test % error
testError = [Pct_error2test,Pct_error3test,Pct_error4test]
max(testError)
