function result = Attributes_Extraction_Ploting(dataSet, scope)
    % extract attribution STD
    
    k = length(scope) ;
    n = 7 ; % number of attributes
    curve_seq = 3 ;
    range = 20 ;
    result = zeros(3, size(dataSet, 1)) ;
    
    for i=1:size(dataSet, 1)
        left = max([1, i-range/2]) ;
        right = min([size(dataSet, 1), i+range/2]) ;
        
        % 1.STD
        result(1, i) = std( dataSet(left:right, curve_seq) ) ;
        
        % 2.MAD
        tmp = dataSet(left:right, curve_seq) ;
        result(2, i) = median(abs(tmp - median(tmp))) ;
        
        % 3. IR
        len = length( dataSet(left:right, curve_seq) ) ;
        tmp = sort( dataSet(left:right, curve_seq) ) ;
        mid_small = tmp( fix(len/4) ) ;
        mid_large = tmp( fix(len*3/4) ) ;
        result(3, i) = (mid_large - mid_small)/2 ;
    end
    
    % ploting
    figure ;
    title('STD infomation') ;
    xlabel('time(s)') ;
    ylabel('Varince') ;
    hold on ;
    plot(result(1,:)) ;
    for i=1:size(scope,1)
        plot([scope(i,1) scope(i,1)], [0 1], ':r') ;
        plot([scope(i,2) scope(i,2)], [0 1], ':r') ;
    end
    hold off ;
    
    figure ;
    title('MAD infomation') ;
    xlabel('time(s)') ;
    ylabel('MAD') ;
    hold on ;
    plot(result(2,:)) ;
    for i=1:size(scope,1)
        plot([scope(i,1) scope(i,1)], [0 1], ':r') ;
        plot([scope(i,2) scope(i,2)], [0 1], ':r') ;
    end
    hold off ;
    
    figure ;
    title('IR infomation') ;
    xlabel('time(s)') ;
    ylabel('IR') ;
    hold on ;
    plot(result(3,:)) ;
    for i=1:size(scope,1)
        plot([scope(i,1) scope(i,1)], [0 1], ':r') ;
        plot([scope(i,2) scope(i,2)], [0 1], ':r') ;
    end
    hold off ;
end
