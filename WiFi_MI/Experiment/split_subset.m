function disjoint_subset = split_subset(dataSet, label, k)
    % split subset into k part, each class in each part is average
    % dataSet : the set of samples
    % label : the label of each sample
    % k : the number of part
    % disjoint_subset : split into k subset
    % ---------------------------------------------------------------------
    
    n = size(dataSet, 2) ;
    numClass = numel(unique(label)) ;
    for i=1:numClass
        temp = dataSet(find(label == i), :) ;
        total_len = size(temp, 1) ;
        len = floor(total_len/k) ;
        pos = 1 ;
        for j=1:k-1
            classSet{j} = temp(pos:pos+len, :) ;
            pos = pos + len ;
        end
        classSet{k} = temp(pos:end, :) ;
        origin_data{i} = classSet ;
    end
    for i=1:k
        temp = zeros(1, n) ;
        for j=1:numClass
            temp = [temp ; origin_data{j}{i}] ;
        end
        temp(1,:) = [] ;
        disjoint_subset{i} = temp ;
    end
end