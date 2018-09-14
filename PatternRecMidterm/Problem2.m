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
 
%k-NN
CorrectMatrixT = reference(1:500,4);
k = 1;
Z = reference(1:500,1:3)';
v = CorrectMatrixT';
X = reference(501:1000,1:3)';

[z]=k_nn_classifier(Z,v,1,X);

%plotconfusion
targets = datedata(501:1000,4)';
outputs = z;
C = confusionmat(targets,outputs)

