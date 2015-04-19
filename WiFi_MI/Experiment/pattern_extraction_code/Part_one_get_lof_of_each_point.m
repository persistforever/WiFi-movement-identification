%% plot the lof curve
for number=1:3 ; % which curve 
    m = size(dataSet, 1) ;
    curve = [ (1:1:m)' , dataSet(1:m,number) ] ;
    for i=1:2
        curve(:,i) = ( curve(:,i) - min( curve(:,i)) ) / ( max( curve(:,i) ) - min( curve(:,i) )) ;
    %     curve(:,i) = zscore(curve(:,i));
    end
    k = 200 ;
    % curve(1:k,:) = repmat(curve(k,:), k, 1) ;
    % curve((end-k):end,:) = repmat(curve((end-k),:), k+1, 1) ;
    tmp = get_LOF_of_Every_Point(curve(k:(end-k+1),:)) ;
    lof_all(:,number) = [zeros(k,1)+tmp(1); tmp; zeros(k,1)+tmp(end)] ;
end
% figure ;
% plot(lof_all) ;

%% extract abnormal pattern 
% [IDX, pattern] = Abnormal_Pattern_Extraction(lof_all, 2, 6) ;
% scope = Pattern_Extraction(dataSet, IDX, pattern) ;
% [trainData] = Attributes_Extraction(dataSet, scope) ;
% result = Attributes_Extraction_Ploting(dataSet, scope) ;