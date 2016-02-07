function [val] = msh(arg, eps)
    val = arg;
    k = 1;
    next_summand = arg;
    while abs(next_summand) / 3 > eps
        next_summand = next_summand .* arg .* arg ./ ...
            (2 .* k .* (2 .* k + 1));
        val = val + next_summand;
        k = k + 1;
    end
end

