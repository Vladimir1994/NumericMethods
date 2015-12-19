function [x_result, y_result] = appr_lsm(x, y, n)
    m = length(x);
    A = zeros(n + 1);
    A(1, 1) = m;
    for i = 1:n
        A(1, i + 1) = sum(x.^i);
    end
    for i = 2:n + 1
        for j = 1:n + 1 
            A(i, j) = sum(x.^(i + j - 2));
        end
    end
    b = zeros(n + 1, 1);
    for i = 1:n + 1
        b(i) = sum(y.*(x.^(i - 1)));
    end
    a = linsolve(A, b);
    x_result = x(1):.01:x(length(x));
    y_result = zeros(size(x_result));
    for i = 1:n + 1
        y_result = y_result + a(i).*x_result.^(i - 1);
    end
end

