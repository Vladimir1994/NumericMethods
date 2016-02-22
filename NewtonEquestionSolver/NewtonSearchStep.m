function [next_point] = NewtonSearchStep(current_point)
    next_point = current_point - F(current_point) / dF_num(current_point);
end

