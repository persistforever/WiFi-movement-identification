%% create dataSet
[trainData, trainLabel] = create_training_data() ;

%% training data
fea_col = feature_selection(trainData, trainLabel) ;
trainData = trainData(:,fea_col) ;
svm_trainer = svm_training(trainData, trainLabel) ;
classify_label = svm_classifying(svm_trainer, trainData) ;
wrong_num = sum(classify_label ~= trainLabel) ;
fprintf('right rate is %f\n', 1-wrong_num/size(trainData, 1)) ;