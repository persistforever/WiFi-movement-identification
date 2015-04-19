function product_dataSet()
%   function to product dataSet from sample/*.dat
%   -----------------------------------------------------------------------
    for i=8
        for j=8
            cd .. ;
            tmpname = strcat('test', num2str(i), '_', num2str(j)) ;
            name = strcat('sample_data/sit/', tmpname, '.dat') ;
            csi_trace = read_bf_file(name);
            cd Experiment ; 
            dataSet = plotTimeGraph(csi_trace) ;
%             picname = strcat('result_pic/picture/', tmpname, '.jpg') ;
            dataname = strcat('result_pic/picture/', tmpname, '.mat') ;
%             saveas(gcf, picname) ;
            save(dataname, 'dataSet') ;
        end
    end
end