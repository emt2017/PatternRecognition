clear all
close all
clc

wi = [-1 -2 -2 0]
w1 = [0;0;0;1; 1;0;0;1; 1;0;1;1; 1;1;0;1]
w2 = [0;0;1;1; 0;1;1;1; 0;1;0;1; 1;1;1;1]

mistakes = 1;
answer = []

while mistakes ~= 0
    mistakes = 0;

    for i = 4:4:16
        j = i - 3
        check = wi*w1(j:i,:)
        if check <1
            mistakes = mistakes + 1
            answer = wi'+w1(j:i,:)
            wi = answer'
        end
    end
    
    for i = 4:4:16
        j= i-3;
        check = wi*w2(j:i,:)
        if check >-1
            mistakes = mistakes + 1
            answer = wi'-w2(j:i,:)
            wi = answer'
        end
      mistakes
    end
end

wi
% 
% wi*w1(1:4,:) %equals 0 < 1 because belongs to w1, so add wi' and w1
% 
% wi'+w1(1:4,:)
% 
% wi = ans'
% 
% wi*w1(5:8,:) %ans 0 < 1 add wi' and w1
% 
% wi'+ w1(5:8,:)
% 
% wi = ans'
% 
% wi*w1(9:12,:) %ans 0 < 1 add wi' and w1
% 
% wi' + w1(9:12,:)
% 
% wi = ans'
% 
% wi*w1(13:16,:) %ans 2>1 leave alone

