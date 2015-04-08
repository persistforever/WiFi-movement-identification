function product_dataSet()
%   function to product dataSet from sample/*.dat
%   -----------------------------------------------------------------------
    for i=1:10
        for j=1:1
            cd .. ;
            tmpname = strcat('test_run', num2str(i)) ;
            name = strcat('sample_data/run/', tmpname, '.dat') ;
            csi_trace = read_bf_file(name);
            cd Experiment ; 
            dataSet = plotTimeGraph(csi_trace) ;
            picname = strcat('result_pic/run/', tmpname, '.jpg') ;
            dataname = strcat('result_pic/run/', tmpname, '.mat') ;
            saveas(gcf, picname) ;
            save(dataname, 'dataSet') ;
        end
    end
end