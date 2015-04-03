function lrd = get_Lrd(index, k, curve, dis_all)
% -- index 表示所求点的索引
% -- k表示最近邻的个数 
% -- curve表示曲线，第一列表示横坐标，第二列表示纵坐标
% -- dis_all表示所有点的距离(n*n)矩阵
[m, n] = size(curve) ;
k_nearest = [ dis_all(:, index), curve(:,1), curve(:,2), (1:1:m)' ] ;
% 对距离排序并去最小的k个
k_nearest = sort(k_nearest, 1) ;
signal = k_nearest(2:k+1, 4) ;
num = 0 ;
for i=1:k
    num = num + get_Reach_dist(index, signal(i,1), k, curve, dis_all) ;
end
lrd = k/(num) ;
end