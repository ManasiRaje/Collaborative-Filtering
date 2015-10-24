% Questions 1 and 2
clear all;
load('ml-100k\u.data');
r = zeros(943, 1682);

%convert u into R
for i=1:100000
    r(u(i,1), u(i,2)) = u(i,3);
end

% Errors (Question 1)
% R = UV = AY
[A1_10,Y1_10,numIter,tElapsed,finalResidual1_10]=wnmfrule(r,10);      % k =10
[A1_50,Y1_50,numIter,tElapsed,finalResidual1_50]=wnmfrule(r,50);      % k = 50
[A1_100,Y1_100,numIter,tElapsed,finalResidual1_100]=wnmfrule(r,100);     % k = 100

% Errors (Question 2)
[A2_10,Y2_10,numIter,tElapsed,finalResidual2_10]=wnmfrule2(r,10);      % k =10
[A2_50,Y2_50,numIter,tElapsed,finalResidual2_50]=wnmfrule2(r,50);      % k = 50
[A2_100,Y2_100,numIter,tElapsed,finalResidual2_100]=wnmfrule2(r,100);     % k = 100


