function [dydx] = diffeq(x, y)
    global A
    global B
    dydx = zeros(2,1);
    dydx(1) = A * y(2);
    dydx(2) = -B * y(1);
end

