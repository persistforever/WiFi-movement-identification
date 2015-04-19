function [trainData, trainLabel, out] = create_training_data(numMvm)
%   use attibutes extraction to create training dataSet
%   input : numMvm - number of movements
%   output : trainData - attributes set of examples
%            trainLabel - label of examples
% -------------------------------------------------------------------------
    % initializes
    n = 16 ;
    trainData = zeros(1, n) ;
    trainLabel = zeros(1, 1) ;
    m = 1 ;

    %% iterative read data(pick, for label 1)
    if numMvm >= 1
        for i=1:22
        name = strcat('pattern_data/pattern_pick/pattern_pick', num2str(i), '.mat') ;
        tmp = importdata(name) ;
        trainData = [trainData; attributes_extraction(tmp(:,1)), attributes_extraction(tmp(:,3))] ;
        trainLabel = [trainLabel; 1] ;
        m = m + 1 ;
        end
    end

    %% iterative read data(stand2sit, for label 2)
    if numMvm >= 2
        for i=1:14
        name = strcat('pattern_data/pattern_stand2sit/pattern_stand2sit', num2str(i), '.mat') ;
        tmp = importdata(name) ;
        trainData = [trainData; attributes_extraction(tmp(:,1)), attributes_extraction(tmp(:,3))] ;
        trainLabel = [trainLabel; 2] ;
        m = m + 1 ;
        end
    end

    %% iterative read data(sit2stand, for label 3)
    if numMvm >= 3
        for i=1:9
        name = strcat('pattern_data/pattern_sit2stand/pattern_sit2stand', num2str(i), '.mat') ;
        tmp = importdata(name) ;
        trainData = [trainData; attributes_extraction(tmp(:,1)), attributes_extraction(tmp(:,3))] ;
        trainLabel = [trainLabel; 3] ;
        m = m + 1 ;
        end
    end

    %% iterative read data(chair2stand, for label 4)
    if numMvm >= 4
        for i=1:9
        name = strcat('pattern_data/pattern_chair2stand/pattern_chair2stand', num2str(i), '.mat') ;
        tmp = importdata(name) ;
        trainData = [trainData; attributes_extraction(tmp(:,1)), attributes_extraction(tmp(:,3))] ;
        trainLabel = [trainLabel; 4] ;
        m = m + 1 ;
        end
    end

    %% iterative read data(stand2chair, for label 5)
    if numMvm >= 5
        for i=1:10
            name = strcat('pattern_data/pattern_stand2chair/pattern_stand2chair', num2str(i), '.mat') ;
            tmp = importdata(name) ;
            trainData = [trainData; attributes_extraction(tmp(:,1)), attributes_extraction(tmp(:,3))] ;
            trainLabel = [trainLabel; 5] ;
            m = m + 1 ;
        end
    end

    %% iterative read data(stand2sofa, for label 6)
    if numMvm >= 6
        for i=1:10
        name = strcat('pattern_data/pattern_stand2sofa/pattern_stand2sofa', num2str(i), '.mat') ;
        tmp = importdata(name) ;
        trainData = [trainData; attributes_extraction(tmp(:,1)), attributes_extraction(tmp(:,3))] ;
        trainLabel = [trainLabel; 6] ;
        m = m + 1 ;
        end
    end

    %% iterative read data(sofa2stand, for label 7)
    if numMvm >= 7
        for i=1:9
            name = strcat('pattern_data/pattern_sofa2stand/pattern_sofa2stand', num2str(i), '.mat') ;
            tmp = importdata(name) ;
            trainData = [trainData; attributes_extraction(tmp(:,1)), attributes_extraction(tmp(:,3))] ;
            trainLabel = [trainLabel; 7] ;
            m = m + 1 ;
        end
    end

    %{
    %% iterative read data(sofa2sit, for label 8)
    if numMvm >= 8
        for i=1:10
            name = strcat('pattern_data/pattern_sofa2sit/pattern_sofa2sit', num2str(i), '.mat') ;
            tmp = importdata(name) ;
            trainData = [trainData; attributes_extraction(tmp(:,1)), attributes_extraction(tmp(:,3))] ;
            trainLabel = [trainLabel; 8] ;
            m = m + 1 ;
        end
    end
    %}

    %% iterative read data(wave, for label 8)
    if numMvm >= 8
        for i=1:10
            name = strcat('pattern_data/pattern_wave/pattern_wave', num2str(i), '.mat') ;
            tmp = importdata(name) ;
            trainData = [trainData; attributes_extraction(tmp(:,1)), attributes_extraction(tmp(:,3))] ;
            trainLabel = [trainLabel; 8] ;
            m = m + 1 ;
        end
    end

    %% iterative read data(walk, for label 9)
    if numMvm >= 9
        for i=1:7
            name = strcat('pattern_data/pattern_walk/pattern_walk', num2str(i), '.mat') ;
            tmp = importdata(name) ;
            trainData = [trainData; attributes_extraction(tmp(:,1)), attributes_extraction(tmp(:,3))] ;
            trainLabel = [trainLabel; 9] ;
            m = m + 1 ;
        end
    end

    %% iterative read data(run, for label 10)
    if numMvm >= 10
        for i=1:7
            name = strcat('pattern_data/pattern_run/pattern_run', num2str(i), '.mat') ;
            tmp = importdata(name) ;
            trainData = [trainData; attributes_extraction(tmp(:,1)), attributes_extraction(tmp(:,3))] ;
            trainLabel = [trainLabel; 10] ;
            m = m + 1 ;
        end
    end

    %% iterative read data(jump, for label 11)
    if numMvm >= 11
        for i=1:7
            name = strcat('pattern_data/pattern_jump/pattern_jump', num2str(i), '.mat') ;
            tmp = importdata(name) ;
            trainData = [trainData; attributes_extraction(tmp(:,1)), attributes_extraction(tmp(:,3))] ;
            trainLabel = [trainLabel; 11] ;
            m = m + 1 ;
        end
    end

    %% iterative read data(high2stand, for label 12)
    if numMvm >= 12
        for i=1:10
            name = strcat('pattern_data/pattern_high2stand/pattern_high2stand', num2str(i), '.mat') ;
            tmp = importdata(name) ;
            trainData = [trainData; attributes_extraction(tmp(:,1)), attributes_extraction(tmp(:,3))] ;
            trainLabel = [trainLabel; 12] ;
            m = m + 1 ;
        end
    end

    %% iterative read data(stand2high, for label 13)
    if numMvm >= 13
        for i=1:10
            name = strcat('pattern_data/pattern_stand2high/pattern_stand2high', num2str(i), '.mat') ;
            tmp = importdata(name) ;
            trainData = [trainData; attributes_extraction(tmp(:,1)), attributes_extraction(tmp(:,3))] ;
            trainLabel = [trainLabel; 13] ;
            m = m + 1 ;
        end
    end

    trainData(1,:) = [] ;
    trainLabel(1,:) = [] ;
end