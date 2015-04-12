function classify_label = lda_classifying(lda_trainer, testData)
%   use LDA to classify data
%   input : lda_trainer - struction of center and eigenvector
%            testData - attributes set of examples
%   output : classify_label - label for each data
% -------------------------------------------------------------------------
    ev = lda_trainer.eigvector ;
    ct = lda_trainer.center ;
    numClass = size(ct, 1) ;
    ld_data = testData * ev ; % loew dimension data
    classify_label = zeros(size(testData, 1), 1) ;
    for i=1:size(testData, 1)
        tmp = repmat(ld_data(i, :), numClass, 1) ;
        [~, classify_label(i, 1)] = min(sum((tmp - ct).^2, 2)) ;
    end
end 