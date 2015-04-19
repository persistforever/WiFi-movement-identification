%% training data use feature selection & SVM classify

wrong_rate = zeros(13,4) ;
for i=2:14
    % training data use LDA with origin feature
    [trainData, trainLabel] = create_training_data(i) ;
    tmp = cross_validation(trainData, trainLabel, 2) ;
    wrong_rate(i-1,1) = tmp ;
    fprintf('LDA right rate is %f\n', 1-tmp) ;

    % training data use LDA with feature selection
    [trainData, trainLabel] = create_training_data(i) ;
    [fea_col, tmp] = feature_selection(trainData, trainLabel, 2) ;
    wrong_rate(i-1,2) = tmp ;
    fprintf('FS&LDA right rate is %f\n', 1-tmp) ;
    
    % training data use SVM with origin feature
    [trainData, trainLabel] = create_training_data(i) ;
    tmp = cross_validation(trainData, trainLabel, 1) ;
    wrong_rate(i-1,3) = tmp ;
    fprintf('SVM right rate is %f\n', 1-tmp) ;

    % training data use SVM with feature selection
    [trainData, trainLabel] = create_training_data(i) ;
    [fea_col, tmp] = feature_selection(trainData, trainLabel, 1) ;
    wrong_rate(i-1,4) = tmp ;
    fprintf('FS&SVM right rate is %f\n', 1-tmp) ;
end

%% test data
% [testData, testLabel] = create_testing_data(1) ;
% testData = testData(:,fea_col) ;
% classify_label = svm_classifying(svm_trainer, testData) ;
% wrong_rate = sum(classify_label ~= testLabel)/size(classify_label, 1) ;
% fprintf('FS&SVM right rate is %f\n', 1-wrong_rate) ;