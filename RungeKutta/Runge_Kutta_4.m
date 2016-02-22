function [x1 y1, y2, h, he ] = Runge_Kutta_4(A, B, ksi, xk, epsilon)   

    global CountF4;
    CountF4 = 0;
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
    
    he = (h / 2) * sqrt((s4 * epsilon) / sqrt((point_2(1) - point_1(1))...
        * (point_2(1) - point_1(1)) + (point_2(2) - point_1(2)) * ...
        (point_2(2) - point_1(2))));
    
    y0 = [B * pi, A * pi];
    
    [T, Y] = ode45(@diffeq, x1, y0);
    function [dydx] = diffeq(x, y)
        dydx = zeros(2,1);
        dydx(1) = A * y(2);
        dydx(2) = -B * y(1);
    end

    hold on;
    plot(T, Y(:, 1));
    plot(x1, y1, 'r');
    
    plot(T, Y(:, 2), 'g');
    plot(x1, y2, 'k');
    
    figure(2)
    hold on;
    plot(x1, sqrt((abs(y1' - Y(:, 1))) .^ 2 + ...
        (abs(y2' - Y(:, 2))) .^ 2), 'b');
    
    %CountF4
end
