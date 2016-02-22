function [f, h] = dF_num(point)
    h = .001;
    e = 1e-9;
    
    while abs(diffdef(point, h) - diffdef(point, h / 2) > e)
        h = h / 10;
    end
    f = (F(point + h) - F(point - h)) / (2 * h);

    function [y] = diffdef(point, h)
        y = (F(point + h) - F(point - h)) / (2 * h);
    end
end
