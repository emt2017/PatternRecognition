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

%sort
referenceSort = sortrows(reference,4);

%Create theta
%1-1:342,1,2,3
theta(1,1:3) = mean(referenceSort(1:342,1:3));
%2-343:673,1,2,3
theta(2,1:3) = mean(referenceSort(343:673,1:3));
%3-674:1000,1,2,3
theta(3,1:3) = mean(referenceSort(674:1000,1:3));

%k-means

k = 3;
X = datedata(1:1000,1:3)';

[theta,bel,J]=k_means(X,theta);

C = confusionmat(reference(1:1000,4)',bel)


%%%%%%%%%%%%%%%%%%%%PART B%%%%%%%%%%%%%%%%%%%%

%Create theta2
%1-1:342,1,2,3
theta(1,1:3) = referenceSort(1:1,1:3);
%2-343:673,1,2,3
theta(2,1:3) = referenceSort(343:343,1:3);
%3-674:1000,1,2,3
theta(3,1:3) = referenceSort(674:674,1:3);

%k-means

k = 3;
X = reference(1:1000,1:3)';

[theta,bel,J]=k_means(X,theta);

C = confusionmat(reference(1:1000,4)',bel)



