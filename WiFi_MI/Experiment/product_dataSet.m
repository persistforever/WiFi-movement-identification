function Corr = product_dataSet()
    % function to product dataSet from sample/*.dat
    
%     k=1 ;
    Corr = zeros(40, 3) ;
    for i=1:9
        for j=1:1
            cd .. ;
            tmpname = strcat('test_chair2stand', num2str(i)) ;
%             tmpname = strcat(num2str(i), '_', num2str(j)) ;
            name = strcat('sample_data/chair2stand/', tmpname, '.dat') ;
            csi_trace = read_bf_file(name);
            cd Experiment ;
            dataSet = plotTimeGraph(csi_trace) ;
            picname = strcat('result_pic/picture/', tmpname, '_1.jpg') ;
%             dataname = strcat('result_pic/picture/', tmpname, '1.mat') ;
            saveas(gcf, picname) ;
%             save(dataname, 'dataSet') ;
        end
    end
end