%% create dataSet
[trainData, trainLabel] = create_training_data() ;

%% training data
svm_trainer = svm_training(trainData, trainLabel) ;
classify_label = svmclassify(svm_trainer, trainData) ;
wrong_num = sum(classify_label ~= trainLabel) ;