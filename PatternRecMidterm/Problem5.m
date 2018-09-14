clc
clear all
close all

load datedata.mat;

reference = datedata;

%normalize reference
reference1 = reference(1:1000,1)/max(reference(1:1000,1));
reference2 = reference(1:1000,2)/max(reference(1:1000,2));
reference3 = reference(1:1000,3)/max(reference(1:1000,3));
reference4 = reference(1:1000,4);

%normalized reference
reference = cat(2, reference1, reference2, reference3, reference4);

%Sort Training
referenceSort = sortrows(reference(1:500,1:4),4);

inputMatrix = cat(1, referenceSort(1:185,1:3), referenceSort(333:500,1:3));

% Sum Of Errors Squares classifier one against many
%Pseudoinverse solution of mnist data for 2 and 3
data = inputMatrix;
label = [ones(185,1);-ones(168,1)];
aug_data =double([data,ones(353,1)]);

w = aug_data\label;

%Testing of training data 22
check = aug_data*w >= 0;
check = check + (check - 1);

%confusion matrix training
targets = label;
outputs = check;
C = confusionmat(targets,outputs)


%Sort Testing 
referenceSort = sortrows(reference(501:1000,1:4),4);

inputMatrix = cat(1, referenceSort(1:157,1:3), referenceSort(342:500,1:3));
data = inputMatrix;
label = [ones(157,1);-ones(159,1)];
aug_data =double([data,ones(316,1)]);

check = aug_data*w >= 0;
check = check + (check - 1);


%confusion matrix testing
targets = label;
outputs = check;
C = confusionmat(targets,outputs)
