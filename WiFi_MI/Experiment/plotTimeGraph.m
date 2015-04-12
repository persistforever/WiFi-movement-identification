function dataSet = plotTimeGraph(csi_trace)
% 	plot time-CSI graph
%   input : csi_trace - csi infomation(n*3)
%   output : dataSet - new csi_trace 
%   -----------------------------------------------------------------------
    m = size(csi_trace, 1);
    dataSet = zeros(m, 3) ;
    for k=1:m
        t = get_scaled_csi(csi_trace{k}) ;
        t = db(abs(squeeze(t).')) ;
        dataSet(k,:) = mean(t) ;
    end
    dataSet((dataSet < 0)) = 0 ;
    % flitering
    flt_type = 1 ;
    switch flt_type
        case 1
            dataSet = guassian_flitering(dataSet) ;
        case 2
            dataSet = time_flitering(dataSet) ;
        case 3
    end
    
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
    
function flitered_data = time_flitering(dataSet)
%   flitering dataSet use time histroical factor
%   input : dataSet - m*3 matrix for data
%   output : flitered_data - dataSet flierted
%   -----------------------------------------------------------------------
    w = 100 ; % histroical param
    m = size(dataSet, 1) ;
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
    flitered_data = t ;
%     flitered_data = t - repmat(t(1,:), size(t, 1), 1) ;
    
function flitered_data = guassian_flitering(dataSet)
%   flitering dataSet use guassian method
%   input : dataSet - m*3 matrix for data
%   output : flitered_data - dataSet flierted
%   -----------------------------------------------------------------------
    flitered_data = dataSet ;
    h = fspecial('gaussian', 100, 20) ;
    for type=1:3
        flitered_data(:,type) = filter2(h, dataSet(:,type))*20;
    end