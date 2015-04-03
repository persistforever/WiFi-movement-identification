function [IDX, pattern] = Abnormal_Pattern_Extraction(lof_all, numCluster, thrd)
    % extract the abnormal pattern of the lof curve
    % input : lof_all - lof curve
    %         numCluster - the number of clusters
    %         thrd - only care the point which lof > thrd
    % output : IDX - the index of each pattern points
    %          pattern - the point which lof > thread
    % ---------------------------------------------------------------------
    
    % step 1 : clustering
    pattern = find(lof_all>thrd) ;
    k = numCluster ;
    iter = 50 ;
    C = zeros(k, iter) ;
    sumd = zeros(1, iter) ;
    for i=1:iter
        [IDX, C(:,i), tsumd] = kmeans(pattern, k, 'emptyaction', 'singleton') ;
        sumd(:,i) = sum(tsumd) ;
    end
    C = floor(C(:, sumd == min(sumd))) ;
    C = C(:,1) ;
    
    % step 2 : plot 
    figure ; 
    hold on ;
    plot(lof_all) ;
    plot(C, lof_all(C,1),'ro') ;
    plot(pattern, lof_all(pattern,1), 'g.');
    hold off ;
end