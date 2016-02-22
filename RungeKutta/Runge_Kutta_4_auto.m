function [x, y1, y2] = Runge_Kutta_4_auto( A, B, ksi, xk, epsilon)

    global CountF4;
    CountF4 = 0;
    s = 4;
    y0 = [B * pi, A * pi];
    delta = (1 / pi) ^ (s + 1) + sqrt(A ^ 2 * y0(2) * y0(2) ...
        + B ^ 2 * y0(1) * y0(1))^(s + 1);
    h = (epsilon / delta)^(1 / (s + 1));
    H = h;
    b2 = 1. / (2. * ksi);
    b1 = 1 - b2;
    x = 0;
    y1 = B * pi;
    y2 = A * pi;   
    count = 2;
    
    while (x < xk)
        
        if(x(end) + h > xk)
            h = xk - x(end);
        end
                
        [y1_h, y2_h] = nextYorder4(y1(count - 1), y2(count - 1), ...
            A, -B, h, ksi, b1, b2);     
        [y1_h_half_1, y2_h_half_1] = nextYorder4(y1(count - 1), ...
            y2(count - 1), A, -B, h/2, ksi, b1, b2);  
        [y1_h_half_2, y2_h_half_2] = nextYorder4(y1_h_half_1, ...
            y2_h_half_1, A, -B, h/2, ksi, b1, b2);
        
        r = ([y1_h_half_2; y2_h_half_2] - [y1_h; y2_h]) / (1 - 2 ^ (-s));
        r_norm = sqrt(sum(r .^ 2));
        
        if (r_norm > epsilon * 2 ^ s)
            h = h/2;
            continue;
        elseif (r_norm > epsilon && r_norm < epsilon * 2 ^ s)
            x(count) = x(count - 1) + h;
            h = h / 2;
            y1(count) = y1_h_half_2;
            y2(count) = y2_h_half_2;
        elseif (r_norm >= epsilon / 2 ^ (s + 1) && r_norm < epsilon)
            x(count) = x(count - 1) + h;
            y1(count) = y1_h;
            y2(count) = y2_h;
        elseif (r_norm < epsilon / 2 ^ (s + 1))
            x(count) = x(count - 1) + h;
            y1(count) = y1_h;
            y2(count) = y2_h;  
            h = h * 2;          
        end
        H(count) = h;
        count = count + 1;
        R(count - 1) = r_norm;
    end
    
    [T, Y] = ode45(@diffeq, x, y0);
    function [dydx] = diffeq(x, y)
        dydx = zeros(2,1);
        dydx(1) = A * y(2);
        dydx(2) = -B * y(1);
    end

    hold on;
    plot(T, Y(:, 1));
    plot(x, y1, 'r');
    
    plot(T, Y(:, 2), 'g');
    plot(x, y2, 'k');
    
    figure(4)
    hold on;
    plot(x, sqrt((abs(y1' - Y(:, 1))) .^ 2 + ...
        (abs(y2' - Y(:, 2))) .^ 2), 'b');
    
    figure(5)
    hold on;
    plot(x, H, 'b');
    
    figure(6)
    hold on;
    plot(x, sqrt((abs(y1' - Y(:, 1))) .^ 2 + (abs(y2'...
        - Y(:, 2))) .^ 2) ./ R', 'b');
    
    %CountF4
end

