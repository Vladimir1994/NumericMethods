function [x_result, y_result] = spline_3_1(x, y, start_d)
    if(size(x) ~= size(y))
        error('wrong input');
    end
    m = mod((length(x) - 1), 2);
    A = zeros(4*fix((length(x) - 1)/2));
    for i = 1:4:(length(A) - 3)
        A(i, i) = x(fix(i/2) + 1)^3;
        A(i, i + 1) = x(fix(i/2) + 1)^2;
        A(i, i + 2) = x(fix(i/2) + 1);
        A(i, i + 3) = 1;
        A(i + 1, i) = x(fix(i/2) + 2)^3;
        A(i + 1, i + 1) = x(fix(i/2) + 2)^2;
        A(i + 1, i + 2) = x(fix(i/2) + 2);
        A(i + 1, i + 3) = 1;
        A(i + 2, i) = x(fix(i/2) + 3)^3;
        A(i + 2, i + 1) = x(fix(i/2) + 3)^2;
        A(i + 2, i + 2) = x(fix(i/2) + 3);
        A(i + 2, i + 3) = 1;
    end
    A(4, 1) = 3*x(1)^2;
    A(4, 2) = 2*x(1);
    A(4, 3) = 1;
    for i = 8:4:length(A)
        A(i, i - 1) = -1;
        A(i, i - 2) = -2*x(i/2 - 1);
        A(i, i - 3) = -3*x(i/2 - 1)^2;
        A(i, i - 5) = 1;
        A(i, i - 6) = 2*x(i/2 - 1);
        A(i, i - 7) = 3*x(i/2 - 1)^2;
    end
    b = zeros(length(A), 1);
    for i = 1:4:length(b) - 3
        b(i) = y(fix(i/2) + 1);
        b(i + 1) = y(fix(i/2) + 2);
        b(i + 2) = y(fix(i/2) + 3);
        b(i + 3) = 0;
    end
    b(4) = start_d;
    coeffs  = linsolve(A, b);
    x_result = x(1):.01:x(3);
    y_result = coeffs(1).*x_result.^3 + coeffs(2).*x_result.^2 + coeffs(3).*x_result + coeffs(4);
    for i = 3:2:fix(length(x)/2)*2 - 3 
        xx = x(i):.01:x(i + 2);
        yy = coeffs(2*i - 1).*xx.^3 + coeffs(2*i).*xx.^2 + coeffs(2*i + 1).*xx + coeffs(2*i + 2);
        x_result = [x_result xx];
        y_result = [y_result yy];
    end
    if(m == 1)
        [xx, yy] = spline_2_1([x(length(x) - 1) x(length(x))], [y(length(y) - 1) y(length(y))], 3*x(length(x))^2 + 2*x(length(x)) + 1);
        x_result = [x_result xx];
        y_result = [y_result yy];
    else
        xx = x(length(x) - 2):.01:x(length(x));
        yy = coeffs(length(coeffs) - 3).*xx.^3 + coeffs(length(coeffs) - 2).*xx.^2 + coeffs(length(coeffs) - 1).*xx + coeffs(length(coeffs));
        x_result = [x_result xx];
        y_result = [y_result yy];
    end
end