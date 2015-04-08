function [fea_col, wrong_rate] = feature_selection(trainData, trainLabel)
%   use different algorithms to select optimal features
%   input : svm_trainer - svm trainer for each class
%            testData - attributes set of examples
%   output : fea_col - columns position of optimal features
%   -----------------------------------------------------------------------
    [fea_col1, wrong1] = SFS(trainData, trainLabel) ;
    [fea_col2, wrong2] = SBS(trainData, trainLabel) ;
    if wrong1 < wrong2
        fea_col = fea_col1 ;
        wrong_rate = wrong1 ;
    else 
        fea_col = fea_col2 ;
        wrong_rate = wrong2 ;
    end

function [fea_col, wrong] = SFS(trainData, trainLabel)
%   use forward search algorithms
%   input : svm_trainer - svm trainer for each class
%            testData - attributes set of examples
%   output : fea_col - columns position of optimal features
%   -----------------------------------------------------------------------
    numFeature = 12 ;
    condidate = 1:1:numFeature ;
    selected = zeros(1,numFeature) ;
    wrong = size(trainData, 1) ;
    for i=1:numFeature
        pos = 0 ;
        for j=1:size(condidate, 2)
            selected(i) = condidate(j) ;
            tmpTrainData = trainData(:, selected(1:i)) ;
            tmptrainLabel = trainLabel ;
            wrong_rate = cross_validation(tmpTrainData, tmptrainLabel) ;
            if wrong_rate < wrong
                pos = j ;
                wrong = wrong_rate ;
            end
        end
        if pos == 0
            selected(i) = 0 ;
            break ;
        else
            selected(i) = condidate(pos) ;
            condidate(pos) = [] ;
        end
    end
    fea_col = selected ;
    fea_col(fea_col == 0) = [] ;
    
function [fea_col, wrong] = SBS(trainData, trainLabel)
%   use back search algorithms
%   input : svm_trainer - svm trainer for each class
%            testData - attributes set of examples
%   output : fea_col - columns position of optimal features
%   -----------------------------------------------------------------------
    numFeature = 12 ;
    condidate = 1:1:numFeature ;
    selected = zeros(1,numFeature) ;
    tmpTrainData = trainData(:, condidate) ;
    tmptrainLabel = trainLabel ;
    svm_trainer = svm_training(tmpTrainData, tmptrainLabel) ;
    classify_label = svm_classifying(svm_trainer, tmpTrainData) ;
    wrong = sum(classify_label ~= tmptrainLabel) ;
    for i=1:numFeature
        pos = 0 ;
        for j=1:size(condidate, 2)
            selected(i) = condidate(j) ;
            tmpcond = 1:1:numFeature ;
            tmpcond(selected(1:i)) = [] ;
            tmpTrainData = trainData(:, tmpcond) ;
            tmptrainLabel = trainLabel ;
            wrong_rate = cross_validation(tmpTrainData, tmptrainLabel) ;
            if wrong_rate < wrong
                pos = j ;
                wrong = wrong_rate ;
            end
        end
        if pos == 0
            break ;
        else
            selected(i) = condidate(pos) ;
            condidate(pos) = [] ;
        end
    end
    selected(selected == 0) = [] ;
    fea_col = 1:1:numFeature ;
    fea_col(selected) = [] ;