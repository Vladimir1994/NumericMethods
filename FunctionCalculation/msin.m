function [val] = msin(arg, eps)       
    val = arg;
    k = 1;
    next_summand = arg;        
    while abs(next_summand) > eps
        next_summand = next_summand * (-arg * arg / (4 * k * k + 2 * k));
        val = val + next_summand;
        k = k + 1;
    end
end

