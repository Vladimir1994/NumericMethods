function [x_result, y_result] = spline_1_0(x, y)
    if(size(x) ~= size(y))
        error('wrong input');
    end
    A = [x(1) 1; x(2) 1];
    b = [y(1); y(2)];
    coeffs = linsolve(A, b);
    x_result = x(1) : 0.05 : x(2);     
    y_result = coeffs(1) .* x_result + coeffs(2);
    for i = 2:length(x) - 1
        A = [x(i) 1; x(i + 1) 1];
        b = [y(i); y(i + 1)];
        coeffs = linsolve(A, b);
        x_result_tmp = x(i) : 0.05 : x(i + 1);
        x_result = [x_result x_result_tmp];     
        y_result_tmp = coeffs(1) .* x_result_tmp + coeffs(2);
        y_result = [y_result y_result_tmp];
    end
end

