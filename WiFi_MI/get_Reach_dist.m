function reach_dist = get_Reach_dist(index, o, k, curve, dis_all)
temp = dis_all(:, o) ;
temp = sort(temp, 1) ;
a = temp(k+1, 1) ;
b = sqrt( sum( (curve(index,:)-curve(o,:)).^2 ) ) ;
if a>=b
    reach_dist = a ;
else
    reach_dist = b ;
end
end