function lrd_all = get_Lrd_All(curve, dis_all, k_dis_all, k)
n = size(curve,1);
lrd_all = zeros(n, 1) ;
for i=1:n
    k_nearest = [ dis_all(:, i), (1:1:n)' ] ;
    k_nearest = sort(k_nearest, 1) ;
    signal = k_nearest(2:k+1, :) ;
    num = 0 ;
    for j=1:k
        reach_dist = max([ k_dis_all(signal(j,2),1) , signal(j,1) ]) ;
        num = num + reach_dist ;
    end
    lrd_all(i,1) = k/(num) ;
end
end