function k_dist = get_K_distance(index, k, dis_all)
% -- index 表示所求点的索引
% -- k表示最近邻的个数 
% -- curve表示曲线，第一列表示横坐标，第二列表示纵坐标
% -- dis_all表示所有点的距离(n*n)矩阵
%计算点p的k-distance s为输入的曲线
%s为n*1的矩阵 p为2维向量 k为常数
temp = dis_all(:, index) ;
temp = sort(temp, 1) ;
k_dist = temp(k+1, 1) ;
end