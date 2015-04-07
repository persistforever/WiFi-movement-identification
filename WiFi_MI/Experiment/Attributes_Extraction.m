function trainData = Attributes_Extraction(y)
% extract attributes from y 
%   input : y - sequence of dataSet
%   output : etp - std value
% -------------------------------------------------------------------------
    n = 6 ; % number of attributes
    trainData = zeros(1, n) ; % training dataset
    trainData(1,1) = attr_normalized_std(y) ;
    trainData(1,2) = attr_motion_period(y) ;
    trainData(1,3) = attr_median_absolute_deviation(y) ;
    trainData(1,4) = attr_interquartile_range(y) ;
    trainData(1,5) = attr_info_entropy(y) ;
    trainData(1,6) = attr_range(y) ;

%% 1. function to calculate normalized standard deviation
function nstd = attr_normalized_std(y)
%   calculate the normalized standard deviation of y
%   input : y - sequence of dataSet
%   output : etp - std value
%   -----------------------------------------------------------------------
    nstd = std(y) ;
    s = sum(nstd.^2) ;
    nstd = nstd/s ;
    
%% 3. function to calculate period of the motion
function pd = attr_motion_period(y)
%   calculate the period of motion of y
%   input : y - sequence of dataSet
%   output : pd - period length
%   -----------------------------------------------------------------------
    pd = size(y, 1) ;
    
%% 4. function to calculate median absolute deviation
function mad = attr_median_absolute_deviation(y)
%   calculate median absolute deviation of y
%   input : y - sequence of dataSet
%   output : mad - MAD value
%   -----------------------------------------------------------------------
    mad = median(abs(y - median(y))) ;
    
%% 5. function to calculate interquartile range
function ir = attr_interquartile_range(y)
%   calculate interquartile range of y
%   input : y - sequence of dataSet
%   output : ir - IR value
%   -----------------------------------------------------------------------
    n = size(y,1) ;
    pos1 = (n+1)/4 ;
    pos2 = 3*(n+1)/4 ;
    q1 = y(floor(pos1))*(pos1-floor(pos1)) + y(floor(pos1)+1)*(1-pos1+floor(pos1)) ;
    q2 = y(floor(pos2))*(pos1-floor(pos2)) + y(floor(pos2)+1)*(1-pos2+floor(pos2)) ;
    ir = abs(q2 - q1) ;
    
%% 6. function to calculate infomation entropy
function etp = attr_info_entropy(y)
%   calculate the infomation entropy of y
%   input : y - sequence of dataSet
%   output : etp - entropy value
%   -----------------------------------------------------------------------
    duan=10;
    x_min=min(y);
    x_max=max(y);
    maxf(1)=abs(x_max-x_min);
    maxf(2)=x_min;
    duan_t=1.0/duan;
    jiange=maxf(1)*duan_t;
    % for i=1:10
    % pnum(i)=length(find((y_p>=(i-1)*jiange)&(y_p<i*jiange)));
    % end
    pnum(1)=length(find(y<maxf(2)+jiange));
    for i=2:duan-1
        pnum(i)=length(find((y>=maxf(2)+(i-1)*jiange)&(y<maxf(2)+i*jiange)));
    end
    pnum(duan)=length(find(y>=maxf(2)+(duan-1)*jiange));
    %sum(pnum)
    ppnum=pnum/sum(pnum);
    %sum(ppnum)
    etp=0;
    for i=1:duan
        if ppnum(i)==0
            Hi=0;
        else
            Hi=-ppnum(i)*log2(ppnum(i));
        end
        etp=etp+Hi;
    end
    
%% 7. function to calculate range
function rg = attr_range(y)
%   calculate the range of y
%   input : y - sequence of dataSet
%   output : rg - range value
%   -----------------------------------------------------------------------
    rg = max(y) - min(y) ;