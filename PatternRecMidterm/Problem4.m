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

inputMatrix = cat(1, referenceSort(1:185,1:3), referenceSort(333:500,1:3));
outputMatrix = zeros(1,length(inputMatrix));
x = [];
for i = 1:length(inputMatrix)
    
    x = inputMatrix(i,1:3);
    
    %Find Decision Boundary m1 and m3 are naturally transposed
    d1 = x'.*m1' - 0.5*m1*m1';

    d3 = x'.*m3' - 0.5*m3*m3';

    d13 = d1 - d3;
    
    if sum(d13)>0
       outputMatrix(i) = 1;
    end
    if sum(d13) < 0 
        outputMatrix(i) = 3;
    end
    
end

%confusion matrix training
targets = cat(1, referenceSort(1:185,4), referenceSort(333:500,4));
outputs = outputMatrix;
C = confusionmat(targets,outputs)

%Sort Testing 
referenceSort = sortrows(reference(501:1000,1:4),4);

inputMatrix = cat(1, referenceSort(1:157,1:3), referenceSort(342:500,1:3));
outputMatrix = zeros(1,length(inputMatrix));
x = [];
for i = 1:length(inputMatrix)
    
    x = inputMatrix(i,1:3);
    
    %Find Decision Boundary m1 and m3 are naturally transposed
    d1 = x'.*m1' - 0.5*m1*m1';

    d3 = x'.*m3' - 0.5*m3*m3';

    d13 = d1 - d3;
    
    if sum(d13)>0
       outputMatrix(i) = 1;
    end
    if sum(d13) < 0 
        outputMatrix(i) = 3;
    end
    
end

%confusion matrix training
targets = cat(1, referenceSort(1:157,4), referenceSort(342:500,4));
outputs = outputMatrix;
C = confusionmat(targets,outputs)

