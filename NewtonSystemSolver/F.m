function [F] = F(x)
    F = zeros(2, 1);
    F(1) = - x(1) + cos(x(2) + 0.5) - 2;
    F(2) = sin(x(1)) - 2 * x(2) - 1;
end

