function [testData, testLabel] = create_testing_data(numMvm)
%   use attibutes extraction to create test dataSet
%   input : numMvm - number of movements
%   output : testData - attributes set of examples
%            testLabel - label of examples
% -------------------------------------------------------------------------
    % initializes
    n = 16 ;
    testData = zeros(1, n) ;
    testLabel = zeros(1, 1) ;
    m = 1 ;

    %% iterative read data(sit_left, for label 15)
    if numMvm >= 1
        for i=1:16
            name = strcat('pattern_data/pattern_sit_test/pattern_sit_test', num2str(i), '.mat') ;
            tmp = importdata(name) ;
            testData = [testData; attributes_extraction(tmp(:,1)), attributes_extraction(tmp(:,3))] ;
            testLabel = [testLabel; 2] ;
            m = m + 1 ;
        end
    end

    testData(1,:) = [] ;
    testLabel(1,:) = [] ;
end