function [val] = marctg(arg, eps)     
    k = 1;

    if abs(arg) < 1

        next_summand = arg;
        val = arg;

        while abs(next_summand) > eps
            next_summand = (-1) .* next_summand .* arg .* arg ...
                .* (2 .* k - 1) ./ (2 .* k + 1);
            val = val + next_summand;
            k = k + 1;
        end

    else

        next_summand = 1 / arg;
        val = 1 / arg;

        while abs(next_summand) > eps
            next_summand = (-1) .* next_summand .* (2 .* k - 1) ./ ...
                ((arg .* arg) .* (2 .* k + 1));
            val = val + next_summand;
            k = k + 1; 
        end

        val = (pi ./ 2) .* sign(arg) - val;

    end
end

