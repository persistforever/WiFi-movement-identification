function disMat = get_Distance_All(curve)
%返回任意两点之间的距离矩阵
%s为n*2的矩阵，disMat为n*n的矩阵
n = size(curve,1);
disMat = zeros(n);
for i = 1:n
    for j = i:n
        disMat(i,j) = sqrt((curve(i,:)-curve(j,:))*(curve(i,:)-curve(j,:))');
    end
end
disMat = disMat + disMat';
end

