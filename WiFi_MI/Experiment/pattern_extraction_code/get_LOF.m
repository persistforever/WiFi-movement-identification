function lof = get_LOF(index, k, curve, dis_all)
% -- index 表示所求点的索引
% -- k表示最近邻的个数 
% -- curve表示曲线，第一列表示横坐标，第二列表示纵坐标
% -- dis_all表示所有点的距离(n*n)矩阵
[m, n] = size(curve) ;
k_nearest = [ dis_all(:,index), (1:1:m)'] ;
% 对距离排序并去最小的k个
k_nearest = sort(k_nearest, 1) ;
signal = k_nearest(2:k+1, 2) ;
num = 0;
for i=1:k
    num = num + get_Lrd(signal(i, 1), k, curve, dis_all) ;
end
lof = num / ( k * get_Lrd(index, k, curve, dis_all)) ;
end