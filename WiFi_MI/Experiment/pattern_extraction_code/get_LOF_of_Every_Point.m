function lof_all = get_LOF_of_Every_Point(curve)
n = size(curve, 1) ;
dis_all = get_Distance_All(curve) ;
k = 100 ;
k_dis_all = get_K_Dist_All(curve, dis_all, k) ;
lrd_all = get_Lrd_All(curve, dis_all, k_dis_all, k) ;
lof_all = zeros(n, 1) ;
for i=1:n
    fprintf(strcat(num2str(i),', ')) ;
    k_nearest = [ dis_all(:,i), (1:1:n)'] ;
    k_nearest = sort(k_nearest, 1) ;
    signal = k_nearest(2:k+1, 2) ;
    num = 0;
    for j=1:k
        num = num + lrd_all(signal(j,1), 1) ;
    end
    lof_all(i,1) = num / ( k * lrd_all(i,1)) ;
end
fprintf('\n') ;
end