function [ summ ] = Gauss(x_2, l_point, r_point, int_cnt, b)
    
    mu = zeros(2 * int_cnt, 1);
    
    for j = 1:2 * int_cnt
        mu(j) = ((x_2 - l_point) ^ (j - b) - ...
            (x_2 - r_point) ^ (j - b)) / (j - b);
    end
    
    A1 = zeros(int_cnt);
    B1 = zeros(int_cnt, 1);
    
    for s = 1:int_cnt
        for i = 1:int_cnt
            A1(i, s) = mu(i + s - 1);
            B1(s) = - mu(int_cnt + s);
        end
    end
    
    a = linsolve(A1, B1);
    a = [1; a(end:-1:1)];
    points = x_2 - roots(a);
    
    X = zeros(length(points));
    
    for i = 1:length(points)
        for j = 1:length(points)
            X(i, j) = (x_2 - points(j)) ^ (i - 1);
        end
    end
    A = linsolve(X, mu(1:length(mu) / 2));
    summ = sum(A .* F(points));
end

