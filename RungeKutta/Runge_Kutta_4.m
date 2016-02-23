function [x1, y1, y2, h] = Runge_Kutta_4(A, B, ksi, xk, epsilon)   
    h = pi;
    s4 = 5;
    R = -1;
    while(abs(R) > epsilon)
        [x1, y1, y2] = Runge_Kutta( A, B, ksi, xk, h, @nextYorder4);
        point_1 = [y1(end), y2(end)];
        [x2, y3, y4] = Runge_Kutta( A, B, ksi, xk, h / 2, @nextYorder4);
        point_2 = [y3(end), y4(end)];
        R1 = abs(point_2(1) - point_1(1)) / s4;
        R2 = abs(point_2(2) - point_1(2)) / s4;
        R = sqrt(R1 * R1 + R2 * R2);
        h = h / 2;
    end
end
