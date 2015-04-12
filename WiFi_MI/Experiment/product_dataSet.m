function product_dataSet()
%   function to product dataSet from sample/*.dat
%   -----------------------------------------------------------------------
    for i=1:5
        for j=1
            cd .. ;
            tmpname = strcat('test_sit_slow', num2str(i)) ;
            name = strcat('sample_data/other/', tmpname, '.dat') ;
            csi_trace = read_bf_file(name);
            cd Experiment ; 
            dataSet = plotTimeGraph(csi_trace) ;
            picname = strcat('result_pic/picture/', tmpname, '.jpg') ;
            dataname = strcat('result_pic/picture/', tmpname, '.mat') ;
            saveas(gcf, picname) ;
            save(dataname, 'dataSet') ;
        end
    end
end