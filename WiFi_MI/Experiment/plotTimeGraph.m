function dataSet = plotTimeGraph(csi_trace)
% 	plot time-CSI graph
%   input : csi_trace - csi infomation(n*3)
%   output : dataSet - new csi_trace 
%   -----------------------------------------------------------------------
    m = size(csi_trace, 1);
    dataSet = zeros(m, 3) ;
    w = 100 ; % histroical param
    for k=1:m
        t = get_scaled_csi(csi_trace{k}) ;
        t = db(abs(squeeze(t).')) ;
        dataSet(k,:) = mean(t) ;
    end
    dataSet((dataSet < 0)) = 0 ;
    t = dataSet ;
    for type = 1:3
        for p=w:m
            sum_mol = 0 ; % Molecular
            sum_den = 0 ; % Denominator
            for q=w:-1:1
                sum_mol = sum_mol + q*dataSet(p-(w-q),type) ;
                sum_den = sum_den + q ;
            end
            t(p,type) = sum_mol/sum_den ;
        end
    end
    dataSet = t;
    dataSet = dataSet - repmat(dataSet(1,:), size(dataSet, 1), 1) ;
    % ploting
    % %{
    % figure ;
    clf;
    hold on ;
    plot(dataSet(:,1),'r') ;
    plot(dataSet(:,2),'g') ;
    plot(dataSet(:,3),'b') ;
    xlabel('time(s)') ;
    ylabel('CSI(db)') ;
    title('the CSI curve changes with time') ;
    legend('MIMO1', 'MIMO2', 'MIMO3') ;
    hold off ;
    % %}
end