function svm_trainer = svm_training(trainData, trainLabel)
%   use support vector machine to train data
%   input : trainData - attributes set of examples
%            trainLabel - label of examples
%   output : wrong_num - number of error label data
% -------------------------------------------------------------------------
    svm_trainer = svmtrain(trainData, trainLabel) ;
end