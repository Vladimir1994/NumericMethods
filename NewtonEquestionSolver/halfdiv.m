function [left_point_next, right_point_next] = ...
          halfdiv(left_point_curr, right_point_curr)
      
    mean = (left_point_curr + right_point_curr) / 2;
    if (F(mean) > 0)
        left_point_next = mean;
        right_point_next = right_point_curr;
    else
        right_point_next = mean;
        left_point_next = left_point_curr;
    end
end
