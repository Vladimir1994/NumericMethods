function [x1, y1, y2, h] = RungeKutta2(A, B, ksi, xk, epsilon) 
    h = pi;
    s2 = 3;
    R = -1;
    while(abs(R) > epsilon)
        [x1, y1, y2] = Runge_Kutta(A, B, ksi, xk, h, @nextYorder2);
        point_1 = [y1(end), y2(end)];
        [x2, y3, y4] = Runge_Kutta(A, B, ksi, xk, h / 2, @nextYorder2);
        point_2 = [y3(end), y4(end)];
        R1 = abs(point_2(1) - point_1(1)) / s2;
        R2 = abs(point_2(2) - point_1(2)) / s2;
        R = sqrt(R1 * R1 + R2 * R2);
        h = h / 2;
    end
end

