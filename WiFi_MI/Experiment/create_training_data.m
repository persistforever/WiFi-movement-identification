function [trainData, trainLabel] = create_training_data()
%   use attibutes extraction to create training dataSet
%   output : trainData - attributes set of examples
%            trainLabel - label of examples
% -------------------------------------------------------------------------
    % initializes
    curve = 3 ;
    trainData = zeros(4*15, 5) ;
    trainLabel = zeros(4*15, 1) ;

    % iterative read data(squat, for label 1)
    num = 1 ;
    for i=5:8
        for j=1:15
            name = strcat('result_pic/mat/pattern', num2str(i), '_', ...
                num2str(j), '.mat') ;
            tmp = importdata(name) ;
            trainData(num, :) = Attributes_Extraction(tmp(:,curve)) ;
            trainLabel(num) = 1 ;
            num = num + 1 ;
        end
    end
    % iterative read data(pick, for label 2)
    for i=1:12
        name = strcat('result_pic/mat2/pattern_pick', num2str(i), '.mat') ;
        tmp = importdata(name) ;
        trainData(num, :) = Attributes_Extraction(tmp(:,curve)) ;
        trainLabel(num) = 2 ;
        num = num + 1 ;
    end
end