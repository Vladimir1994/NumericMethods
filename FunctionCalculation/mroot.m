function [val] = mroot(arg, eps)
    val = 1;
    m = val;
    while m > eps
        val_new = (1 / 2) .* (val + arg / val);
        m = abs(val - val_new);
        val = val_new;
    end
end

