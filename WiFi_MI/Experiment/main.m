%% training data use feature selection & SVM classify

wrong_rate = zeros(7, 4) ;
for i=4:10
    % training data use LDA with origin feature
    [trainData, trainLabel] = create_training_data(i) ;
    tmp = cross_validation(trainData, trainLabel, 2) ;
    wrong_rate(i,1) = tmp ;
    fprintf('LDA right rate is %f\n', 1-tmp) ;

    % training data use LDA with feature selection
    [trainData, trainLabel] = create_training_data(i) ;
    [~, tmp] = feature_selection(trainData, trainLabel, 2) ;
    wrong_rate(i,2) = tmp ;
    fprintf('FS&LDA right rate is %f\n', 1-tmp) ;
    
    % training data use SVM with origin feature
    [trainData, trainLabel] = create_training_data(i) ;
    tmp = cross_validation(trainData, trainLabel, 1) ;
    wrong_rate(i,3) = tmp ;
    fprintf('SVM right rate is %f\n', 1-tmp) ;

    % training data use SVM with feature selection
    [trainData, trainLabel] = create_training_data(i) ;
    [~, tmp] = feature_selection(trainData, trainLabel, 1) ;
    wrong_rate(i,4) = tmp ;
    fprintf('FS&SVM right rate is %f\n', 1-tmp) ;
end