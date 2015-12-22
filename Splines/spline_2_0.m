function [x_result, y_result] = spline_2_0(x, y)
    if(size(x) ~= size(y))
        error('wrong input');
    end
    A = [x(1)^2 x(1) 1; x(2)^2 x(2) 1; x(3)^2 x(3) 1];
    b = [y(1); y(2); y(3)];
    coeffs = linsolve(A, b);
    x_result = x(1) : 0.05 : x(3);     
    y_result = coeffs(1) .* x_result.^2 + coeffs(2) .* x_result + coeffs(3);
    counter = 3;
    while(length(x) - counter > 1)
        A = [x(counter)^2 x(counter) 1; x(counter + 1)^2 x(counter + 1) 1; 
            x(counter + 2)^2 x(counter + 2) 1];
        b = [y(counter); y(counter + 1); y(counter + 2)];
        coeffs = linsolve(A, b);
        x_result_tmp = x(counter) : 0.05 : x(counter + 2);
        x_result = [x_result x_result_tmp];     
        y_result_tmp = coeffs(1) .* x_result_tmp.^2 + coeffs(2) .* x_result_tmp + coeffs(3);
        y_result = [y_result y_result_tmp];
        counter = counter + 2;
    end
    if(counter < length(x))
        [x_result_tmp, y_result_tmp] = spline_1_0(x(counter:length(x)), y(counter:length(x)));
        x_result = [x_result x_result_tmp];
        y_result = [y_result y_result_tmp];
    end
end

