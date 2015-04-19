function k_DistMat = get_K_Dist_All(curve, dis_all, k)
n = size(curve,1);
k_DistMat = zeros(n, 1) ;
for i=1:n
    temp = dis_all(:,i) ;
    temp = sort(temp, 1) ;
    k_DistMat(i, 1) = temp(k+1, 1) ;
end
end