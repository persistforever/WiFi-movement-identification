function Corr = product_dataSet()
    % function to product dataSet from sample/*.dat
    
%     k=1 ;
    Corr = zeros(40, 3) ;
    for i=1:2
        for j=1:1
            cd .. ;
            name = strcat('sample_data/other/test_pick', num2str(i), '.dat') ;
            csi_trace = read_bf_file(name);
            cd Experiment ;
            dataSet = plotTimeGraph(csi_trace) ;
%             tmp = corrcoef(dataSet) ;
%             Corr(k,:) = [tmp(1,2), tmp(1,3), tmp(2,3)] ;
%             k = k+1 ;
            picname = strcat('result_pic/picture4/test_pick', num2str(i), '.jpg') ;
            dataname = strcat('result_pic/mat4/test_pick', num2str(i), '.mat') ;
            saveas(gcf, picname) ;
            save(dataname, 'dataSet') ;
        end
    end
end