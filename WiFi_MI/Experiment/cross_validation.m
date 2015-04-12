function wrong_rate = cross_validation(dataSet, label, numTrainer)
%   cross validation to train and test classifiers, use 20% data as test
%   input : trainData - attributes set of examples
%           trainLabel - label of examples
%   -----------------------------------------------------------------------
    %% use a part to test
    %{
    trainData = zeros(1, size(dataSet,2)) ;
    testData = zeros(1, size(dataSet,2)) ;
    trainLabel = zeros(1, 1) ;
    testLabel = zeros(1, 1) ;
    numClass = numel(unique(label)) ;
    for i=1:numClass
        tmpData = dataSet(label == i, :) ;
        numTest = round(size(tmpData, 1)*0.2) ;
        pos = randperm(size(tmpData, 1)) ;
        train_pos = pos((numTest+1):end) ; % pos that train examples exist
        test_pos = pos(1:numTest) ; % pos that test examples exist
        trainData = [trainData; tmpData(train_pos, :)] ;
        testData = [testData; tmpData(test_pos, :)] ;
        trainLabel = [trainLabel; zeros((size(tmpData, 1)-numTest), 1)+i] ;
        testLabel = [testLabel; zeros(numTest, 1)+i] ;
    end
    trainData(1,:) = [] ;
    trainLabel(1,:) = [] ;
    testData(1,:) = [] ;
    testLabel(1,:) = [] ;
    svm_trainer = svm_training(trainData, trainLabel) ;
    classify_label = svm_classifying(svm_trainer, testData) ;
    wrong_num = sum(classify_label ~= testLabel) ;
    wrong_rate = wrong_num / size(dataSet, 1) ;
    %}
    
    %% use true cross validationfunction
    % step 1 : split data
    n = size(dataSet, 2) ;
    numWrong = 0 ;
    numTest = 0 ;
    k = 5 ;
    t_dataSet = [dataSet, label] ;
    subSet = split_subset(t_dataSet, label, k) ;
    % step 2 : for each model test
    for i=1:k
        % trainData
        trainData = zeros(1, n+1) ;
        for j=1:k
            if j~=i      
               trainData = [trainData ; subSet{j}] ;
            end
        end
        trainData(1,:) = [] ;
        trainLabel = trainData(:,end) ;
        trainData = trainData(:,1:end-1) ;   
        % testData
        testLabel = subSet{i}(:,end) ;
        testData = subSet{i}(:,1:end-1) ;
        switch numTrainer
            case 1
                svm_trainer = svm_training(trainData, trainLabel) ;
                classify_label = svm_classifying(svm_trainer, testData) ;
            case 2
                lda_trainer = lda_training(trainData, trainLabel) ;
                classify_label = lda_classifying(lda_trainer, testData) ;
        end
        t_num = sum(classify_label ~= testLabel) ;
        numWrong = numWrong + t_num ;
        numTest = numTest + size(testData, 1) ;
    end 
    wrong_rate = numWrong/numTest ;
end