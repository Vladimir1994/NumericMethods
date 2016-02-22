function [sum] = RightDotIntegration(x_1, x_2, int_cnt)
	dx = abs(x_2 - x_1) / int_cnt;
    point = x_1 + dx;
    sum = 0;
    for i = 1:int_cnt
        sum = sum + F(point) * dx;
        point = point + dx;
    end
end
