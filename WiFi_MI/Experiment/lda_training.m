function lda_trainer = lda_training(trainData, trainLabel)
%   use LDA to train data
%   input : trainData - attributes set of examples
%            trainLabel - label of examples
%   output : lda_trainer - struction of center and eigenvector
%   -----------------------------------------------------------------------
    [eigvector, ~] = LDA(trainLabel, [], trainData) ;
    if size(eigvector, 2) > 3
        eigvector = eigvector(:, 1:3) ;
    end
    % plot3(eigvector(:,1), eigvector(:,2), eigvector(:,3), '.') ;
    numClass = numel(unique(trainLabel)) ;
    center = zeros(numClass, size(eigvector, 2)) ;
    for i=1:numClass
        subData = trainData(trainLabel == i, :) ;
        tmp = subData * eigvector ;
        center(i, :) = mean(tmp, 1) ;
    end
    lda_trainer.center = center ;
    lda_trainer.eigvector = eigvector ;
end