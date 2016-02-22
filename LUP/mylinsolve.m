function [x] = mylinsolve(A, b)
    
    dim = length(A);
    [L, U, P, ~] = LUP(A);
    b = P * b;
    y = zeros(dim, 1);
    x = zeros(dim, 1);
    y(1) = b(1);
    
    for t = 2:dim
        sum = 0;
        for m = 1:(t - 1)
            sum = sum + L(t, m) * y(m);
        end
        y(t) = b(t) - sum;
    end

    x(dim) = y(dim) / U(dim, dim);
    
    for t = (dim - 1):-1:1
        sum = 0;
        for m = t + 1:dim
            sum = sum + U(t, m) * x(m);
        end
        x(t) = (y(t) - sum) / U(t, t);
    end
end

