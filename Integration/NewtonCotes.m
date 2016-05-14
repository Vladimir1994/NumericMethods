function [ summ ] = NewtonCotes(x_2, l_point, r_point, int_cnt, b)
    dx = abs(r_point - l_point) / (int_cnt - 1);
    points = zeros(int_cnt, 1);
    for i = 1:int_cnt
        points(i) = l_point + dx * (i - 1);
    end
    mu = zeros(length(points), 1);
    for j = 1:length(points)
        mu(j) = ((x_2 - points(1)) ^ (j - b) - ...
            (x_2 - points(length(points))) ^ (j - b)) / (j - b);
    end
    X = zeros(length(points));
    for i = 1:length(points)
        for j = 1:length(points)
            X(i, j) = (x_2 - points(j)) ^ (i - 1);
        end
    end
    A = linsolve(X, mu);
    summ = sum(A .* F(points));
end
