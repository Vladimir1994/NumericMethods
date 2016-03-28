function [x_result, y_result] = spline_3_2(x, y)
    if(size(x) ~= size(y))
        error('wrong input');
    end
    n = length(x);
    a = y;
    h = zeros(n, 1);
    for i = 2:n
        h(i) = x(i) - x(i - 1);
    end
    c_system = zeros(n);
    c_vector = zeros(n, 1);
    c_system(1, 1) = 1;
    c_system(n, n) = 1;
    c_vector(n) = 0;
    for i = 2:n - 1
        c_system(i, i - 1) = h(i);
        c_system(i, i) = 2 * (h(i) + h(i + 1));
        c_system(i, i + 1) = h(i + 1);
        c_vector(i) = 6 * ((y(i + 1) - y(i)) / ...
            h(i + 1) - (y(i) - y(i - 1)) / h(i));
    end
    c = linsolve(c_system, c_vector);
    d = zeros(n, 1);
    b = zeros(n, 1);
    for i = 2:n
        d(i) = (c(i) - c(i - 1)) / h(i);
        b(i) = h(i) * (2 * c(i) + c(i - 1)) ...
            / 6 + (y(i) - y(i - 1)) / h(i);
    end
    x_result = x(1):.01:x(2);
    y_result = a(2) + b(2) .* (x_result - x(2)) + (c(2) / 2) .* ...
        (x_result - x(2)) .^ 2 + (d(2) / 6) .* (x_result - x(2)) .^ 3;
    for i = 3:n
        xx = x(i - 1):.01:x(i);
        yy = a(i) + b(i) .* (xx - x(i)) + (c(i) / 2) .* ...
            (xx - x(i)) .^ 2 + (d(i) / 6) .* (xx - x(i)) .^ 3;
        x_result = [x_result xx];
        y_result = [y_result yy];
    end
end