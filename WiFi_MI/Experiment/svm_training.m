function svm_trainer = svm_training(trainData, trainLabel)
%   use support vector machine to train data
%   input : trainData - attributes set of examples
%            trainLabel - label of examples
%   output : svm_trainer - svm trainer for each class
% -------------------------------------------------------------------------
    numClass = numel(unique(trainLabel)) ;
    svm_trainer = cell(numClass, 1) ;
    for i=1:numClass
        subLabel = zeros(size(trainLabel, 1), 1) ;
        subLabel(trainLabel == i, 1) = 1 ;
        % choose type
        type = 2 ;
        switch type
            case 1
                svm_trainer{i} = svmtrain(trainData, subLabel, 'kernel_function', 'polynomial', 'polyorder', 1) ;
            case 2 
                svm_trainer{i} = svmtrain(trainData, subLabel, 'kernel_function', 'polynomial', 'polyorder', 2) ;
            case 3
                svm_trainer{i} = svmtrain(trainData, subLabel, 'kernel_function', 'rbf') ;
        end
    end
end