%% plot the lof curve
% load('csi_experiment3.mat') ;
% csi_trace = csi_trace_orig(100:end, :) ; % scope
number = 1 ; % which curve 
% dataSet = plotTimeGraph(csi_trace) ;
m = size(dataSet1, 1) ;
% m = 100 ;
curve = [ (1:1:m)' , dataSet1(1:m,number) ] ;
for i=1:2
    %curve(:,i) = ( curve(:,i) - min( curve(:,i)) ) / ( max( curve(:,i) ) - min( curve(:,i) )) ;
    curve(:,i) = zscore(curve(:,i));
end
lof_all = get_LOF_of_Every_Point(curve) ;
figure ;
plot(lof_all) ;

% extract abnormal pattern 
[IDX, pattern] = Abnormal_Pattern_Extraction(lof_all, 2, 6) ;
% scope = Pattern_Extraction(dataSet, IDX, pattern) ;
% [trainData] = Attributes_Extraction(dataSet, scope) ;
% result = Attributes_Extraction_Ploting(dataSet, scope) ;