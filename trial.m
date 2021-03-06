% Question 4
%using Method 1 ==> wnmfrule2, k = 10
clear all;
load('ml-100k\u.data');

% create a random ordering of 1 to N = 100,000
z = randperm(100000);

for j = 1 : 1 % test set
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

    [X,Y,numIter,tElapsed,finalResidual]=wnmfrule1(train,10);
    R_predicted = X * Y;
    R_predicted(find(~test)) = 0;
    
    
    %R = [0 5]; % Range
    %dR = diff( R );

    %R_predicted =  R_predicted - min( R_predicted(:)); % set range of A between [0, inf)
    %R_predicted =  R_predicted ./ max( R_predicted(:)) ; % set range of A between [0, 1]
    %R_predicted =  R_predicted .* dR ; % set range of A between [0, dRange]
    %R_predicted =  R_predicted + R(1); % shift range of A to R

    % --------------------------------------------------------------------------
    ind = 1;
    for t = 1.1:0.1:4.9 %threshold values
    %for t = 0.01:0.001:1
        test_t = test > t;
        R_predicted_t = R_predicted > t;
        % calculate precision and recall
        true_positive = numel(intersect(find(test_t),find(R_predicted_t)));
        true_negative = numel(intersect(find(~test_t),find(~R_predicted_t))) - sum(test(:) == 0);
        false_positive = numel(intersect(find(~test_t),find(R_predicted_t)));
        false_negative = numel(intersect(find(test_t),find(~R_predicted_t)));
        precision(ind) = true_positive/(true_positive + false_positive);
        recall(ind) = true_positive/(true_positive + false_negative);
        ind = ind + 1;   
    end
    scatter(recall, precision,'.');
    %plot(recall, precision);
        pause;
    % --------------------------------------------------------------------------
    
    error(j) = sum(sum(abs(R_predicted - test)))/10000;
end