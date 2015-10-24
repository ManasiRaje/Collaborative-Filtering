%Question 3
%using Method 1 ==> wnmfrule, k = 10
clear all;
load('ml-100k\u.data');

% create a random ordering of 1 to N = 100,000
z = randperm(100000);

for j = 10 : 10
    train = zeros(943, 1682);
    test = zeros(943, 1682);
    start1_train = 1;
    if j == 1
        start1_train = 0;
    end
    stop1_train = (j-1) * 10000;
    [start_test, stop_test, start2_train, stop2_train] = setIndices(start1_train, stop1_train);

    for i = start1_train : stop1_train
        if not((start1_train == stop1_train) && (stop1_train == 0))
            train(u(z(i),1), u(z(i),2)) = u(z(i),3);
        end
    end

    for i = start_test : stop_test
        test(u(z(i),1), u(z(i),2)) = u(z(i),3);
    end

    for i = start2_train : stop2_train
        if not(start2_train == stop2_train && stop2_train == 0)
            train(u(z(i),1), u(z(i),2)) = u(z(i),3);
        end
    end

    %[X,Y_transpose,numIter,tElapsed,finalResidual]=wnmfrule(train,100);
    [X,Y,numIter,tElapsed,finalResidual]=wnmfrule1(train,100);
    % X --> m*k
    % Y --> k*n
    %Y = Y_transpose';

    %X_test = test * Y * inv(Y' * Y);
    %R_predicted = X_test * Y';
    R_predicted = X * Y;
    R_predicted(find(~test)) = 0;
        
    error(j) = sum(sum(abs(R_predicted - test)))/10000;
end