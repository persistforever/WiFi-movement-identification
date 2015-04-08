function [trainData, trainLabel] = create_training_data()
%   use attibutes extraction to create training dataSet
%   output : trainData - attributes set of examples
%            trainLabel - label of examples
% -------------------------------------------------------------------------
    % initializes
    m = 74 ;
    n = 12 ;
    trainData = zeros(m, n) ;
    trainLabel = zeros(m, 1) ;
    num = 1 ;
    
    % iterative read data(pick, for label 1)
    for i=1:22
        name = strcat('pattern_data/pattern_pick/pattern_pick', num2str(i), '.mat') ;
        tmp = importdata(name) ;
        trainData(num, :) = [Attributes_Extraction(tmp(:,1)), Attributes_Extraction(tmp(:,3))] ;
        trainLabel(num) = 1 ;
        num = num + 1 ;
    end

    % iterative read data(stand2sit, for label 2)
    for i=1:14
        name = strcat('pattern_data/pattern_stand2sit/pattern_stand2sit', num2str(i), '.mat') ;
        tmp = importdata(name) ;
        trainData(num, :) = [Attributes_Extraction(tmp(:,1)), Attributes_Extraction(tmp(:,3))] ;
        trainLabel(num) = 2 ;
        num = num + 1 ;
    end
    
    % iterative read data(sit2stand, for label 3)
    for i=1:9
        name = strcat('pattern_data/pattern_sit2stand/pattern_sit2stand', num2str(i), '.mat') ;
        tmp = importdata(name) ;
        trainData(num, :) = [Attributes_Extraction(tmp(:,1)), Attributes_Extraction(tmp(:,3))] ;
        trainLabel(num) = 3 ;
        num = num + 1 ;
    end
    
    % iterative read data(chair2stand, for label 4)
    for i=1:9
        name = strcat('pattern_data/pattern_chair2stand/pattern_chair2stand', num2str(i), '.mat') ;
        tmp = importdata(name) ;
        trainData(num, :) = [Attributes_Extraction(tmp(:,1)), Attributes_Extraction(tmp(:,3))] ;
        trainLabel(num) = 4 ;
        num = num + 1 ;
    end
    
    % iterative read data(stand2chair, for label 5)
    for i=1:10
        name = strcat('pattern_data/pattern_stand2chair/pattern_stand2chair', num2str(i), '.mat') ;
        tmp = importdata(name) ;
        trainData(num, :) = [Attributes_Extraction(tmp(:,1)), Attributes_Extraction(tmp(:,3))] ;
        trainLabel(num) = 5 ;
        num = num + 1 ;
    end
    
    % iterative read data(stand2sofa, for label 6)
    for i=1:10
        name = strcat('pattern_data/pattern_stand2sofa/pattern_stand2sofa', num2str(i), '.mat') ;
        tmp = importdata(name) ;
        trainData(num, :) = [Attributes_Extraction(tmp(:,1)), Attributes_Extraction(tmp(:,3))] ;
        trainLabel(num) = 6 ;
        num = num + 1 ;
    end
end