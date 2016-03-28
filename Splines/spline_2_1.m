function [x_result, y_result] = spline_2_1(x, y, start_d)
    if(size(x) ~= size(y))
        error('wrong input');
    end
    A = zeros(3 * (length(x) - 1));
    for i = 1:3:(length(A) - 2)
        A(i, i) = x(fix(i / 3) + 1) ^ 2;
        A(i, i + 1) = x(fix(i / 3) + 1);
        A(i, i + 2) = 1;
        A(i + 1, i) = x(fix(i / 3) + 2) ^ 2;
        A(i + 1, i + 1) = x(fix(i / 3) + 2);
        A(i + 1, i + 2) = 1;
    end
    A(3, 1) = 2 * x(1);
    A(3, 2) = 1;
    for i = 6:3:length(A)
        A(i, i - 1) = -1;
        A(i, i - 2) = -2 * x(i / 3);
        A(i, i - 4) = 1;
        A(i, i - 5) = 2 * x(i / 3);
    end
    b = zeros(length(A), 1);
    for i = 1:3:length(b) - 2
        b(i) = y(fix(i / 3) + 1);
        b(i + 1) = y(fix(i / 3) + 2);
        b(i + 2) = 0;
    end
    b(3) = start_d;
    coeffs  = linsolve(A, b);
    x_result = x(1):.01:x(2);
    y_result = coeffs(1) .* x_result .^ 2 + coeffs(2) ...
        .* x_result + coeffs(3);
    for i = 2:length(x) - 1
        xx = x(i):.01:x(i + 1);
        yy = coeffs(3 * i - 2) .* xx .^ 2 + coeffs(3*i - 1) ...
            .* xx + coeffs(3 * i);
        x_result = [x_result xx];
        y_result = [y_result yy];
    end
end

