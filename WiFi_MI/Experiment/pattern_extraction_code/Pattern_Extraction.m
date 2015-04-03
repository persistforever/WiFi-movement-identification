function [scope] = Pattern_Extraction(dataSet, IDX, pattern)
    % extract the model pattern of the dataSet
    % input : dataSet - m*3 matrix each colum related to a MIMO
    %         IDX - the index of each pattern points
    %         pattern - the point which lof > thread
    % output : scope - each abnomarl pattern's x point scope
    % ---------------------------------------------------------------------
    
    k = numel(unique(IDX)) ;
    cluster = IDX(1) ;
    scope = zeros(k, 2) ;% the period of the pattern
    num = 1 ;
    curve_seq = 3 ;
    
    scope(num, 1) = pattern(1) ;
    for i=1:length(IDX)
        if IDX(i) ~= cluster
            scope(num, 2) = pattern(i-1) ;
            num = num + 1 ;
            scope(num, 1) = pattern(i) ;
            cluster = IDX(i) ;
        end
    end
    scope(num, 2) = pattern(length(IDX)) ;
    % plot the pattern
    figure ;
    hold on ;
    for i=1:k
        plot(scope(i,1):scope(i,2), dataSet(scope(i,1):scope(i,2), curve_seq)) ;
    end
    hold off ;
end