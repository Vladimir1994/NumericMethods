function [x_result, y_result] = spline_3_0(x, y)
    if(size(x) ~= size(y))
        error('wrong input');
    end
    A = [x(1)^3 x(1)^2 x(1) 1; x(2)^3 x(2)^2 x(2) 1; x(3)^3 x(3)^2 x(3) 1; 
        x(4)^3 x(4)^2 x(4) 1];
    b = [y(1); y(2); y(3); y(4)];
    coeffs = linsolve(A, b);
    x_result = x(1) : 0.05 : x(4);     
    y_result = coeffs(1) .* x_result .^ 3 + coeffs(2) .* x_result .^2 + coeffs(3) .* x_result + coeffs(4);
    counter = 4;
    while(length(x) - counter > 2)
        A = [x(counter)^3 x(counter)^2 x(counter) 1; 
            x(counter+1)^3 x(counter + 1)^2 x(counter + 1) 1; 
            x(counter+2)^3 x(counter + 2)^2 x(counter + 2) 1; 
            x(counter+3)^3 x(counter + 3)^2 x(counter + 3) 1];
        b = [y(counter); y(counter + 1); y(counter + 2); y(counter + 3)];
        coeffs = linsolve(A, b);
        x_result_tmp = x(counter) : 0.05 : x(counter + 3);
        x_result = [x_result x_result_tmp];     
        y_result_tmp = coeffs(1) .* x_result_tmp .^ 3 + coeffs(2) .* x_result_tmp .^ 2 + coeffs(3) .* x_result_tmp + coeffs(4);
        y_result = [y_result y_result_tmp];
        counter = counter + 3;
    end
    if(abs(counter - length(x)) == 2)
        [x_result_tmp, y_result_tmp] = spline_2_0(x(counter:length(x)), y(counter:length(x)));
        x_result = [x_result x_result_tmp];
        y_result = [y_result y_result_tmp];
    end
    if(abs(counter - length(x)) == 1)
        [x_result_tmp, y_result_tmp] = spline_1_0(x(counter:length(x)), y(counter:length(x)));
        x_result = [x_result x_result_tmp];
        y_result = [y_result y_result_tmp];
    end
end

