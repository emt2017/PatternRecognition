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

%Define Variables m1/3 and x1/3 are naturally transposed
m1 = mean(referenceSort(1:185,1:3));

m3 = mean(referenceSort(333:500,1:3));

centerPoint = (m1+m3)/2;

direction = m3 - m1;

decisionPlane = [direction -direction*centerPoint']; %direction*centerpoint'

TrainingMatrix = cat(1, referenceSort(1:185,1:3), referenceSort(333:500,1:3));
TrainingMatrix = cat(2,TrainingMatrix(:,:), ones(353,1));

outputMatrix = -sign( TrainingMatrix*decisionPlane');

%confusion matrix training
targets = cat(1, referenceSort(1:185,4), referenceSort(333:500,4));
targets = cat(1, ones(185,1), -ones(168,1));
outputs = outputMatrix;
C = confusionmat(targets,outputs)

