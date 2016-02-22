function [dF] = dF(x)
    dF = zeros(2);
    dF(1, 1) = - 1;
    dF(2, 2) = - 2;
    dF(1, 2) = -sin(x(2) + 0.5);
    dF(2, 1) = cos(x(1));
end

