function disMat = get_Distance_All(curve)
n = size(curve,1);
disMat = zeros(n);
for i = 1:n
    for j = i:n
        disMat(i,j) = sqrt((curve(i,:)-curve(j,:))*(curve(i,:)-curve(j,:))');
    end
end
disMat = disMat + disMat';
end

