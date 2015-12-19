function [x_result, y_result] = appr_orth(x, y, n)
    n = n + 1;
    m = length(x);
    x_result = x(1):0.01:x(length(x));
    q = zeros(n, length(x_result));
    q(1, :) = 1;
    q(2, :) = x_result - (1/m).*sum(x);
    for j = 3:n
        alpha_num = 0;
        alpha_den = 0;
        for i = 1:m
            alpha_num = alpha_num + x(i).*q(j - 1, fix(-x(1)*100 + 100*(x(i)) + 1)).^2;
            alpha_den = alpha_den + q(j - 1, fix(-x(1)*100 + 100*(x(i)) + 1)).^2;
        end
        alpha = alpha_num / alpha_den;
        beta_num = 0;
        beta_den = 0;
        for i = 1:m
            beta_num = beta_num + x(i)*q(j - 1, fix(-x(1)*100 + 100*(x(i)) + 1)).*q(j - 2, fix(-x(1)*100 + 100*(x(i)) + 1));
            beta_den = beta_den + q(j - 2, fix(-x(1)*100 + 100*(x(i)) + 1)).^2;
        end
        beta = beta_num / beta_den;
        q(j, :) = x_result.*q(j - 1, :) - alpha.*q(j - 1, :) - beta.*q(j - 2, :);
    end
    a = zeros(n, 1);
    for j = 1:n
        a_num = 0;
        a_den = 0;
        for i = 1:m
            a_num = a_num + q(j, fix(-x(1)*100 + 100*(x(i)) + 1)).*y(i);
            a_den = a_den + q(j, fix(-x(1)*100 + 100*(x(i)) + 1)).^2;
        end
        a(j) = a_num / a_den;
    end
    y_result = zeros(size(x_result));
    for i = 1:n
        y_result = y_result + a(i)*q(i, :);
    end
end

