function [start_test, stop_test, start2_train, stop2_train] = setIndices(start1_train, stop1_train)

    start_test = stop1_train + 1;
    stop_test = stop1_train + 10000;
    if(stop_test < 100000)
        start2_train = stop_test + 1;
        stop2_train = 100000;
    else
        start2_train = 0;
        stop2_train = 0;
    end
end
