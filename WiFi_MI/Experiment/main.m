%% create dataSet
[trainData, trainLabel] = create_training_data() ;

%% training data
[fea_col, wrong_rate] = feature_selection(trainData, trainLabel) ;
fprintf('right rate is %f\n', 1-wrong_rate) ;