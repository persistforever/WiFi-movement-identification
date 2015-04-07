function classify_label = svm_classifying(svm_trainer, testData)
%   use support vector machine to classify data
%   input : svm_trainer - svm trainer for each class
%            testData - attributes set of examples
%   output : classify_label - label for each data
% -------------------------------------------------------------------------
    numClass = size(svm_trainer) ;
    classify_label = zeros(size(testData, 1), 1) ;
    for i=1:numClass
        subLabel = svmclassify(svm_trainer{i}, testData) ;
        classify_label(subLabel == 1, 1) = i ;
    end
end