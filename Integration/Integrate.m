function [ summ ] = Integrate(x_1, x_2, intervalCount, b, IntMethod)
	dx = abs(x_2 - x_1) / intervalCount;
    point_l = x_1;
    point_r = x_1 + dx;
    point_m = x_1 + dx / 2; 
    summ = 0;
    for i = 1:intervalCount
        summ = summ + IntMethod(x_2, point_l, point_r, 3, b);
        point_l = point_l + dx;
        point_m = point_m + dx;
        point_r = point_r + dx;        
    end
end