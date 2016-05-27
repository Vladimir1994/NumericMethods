function [x, y1, y2] = RungeKutta2Auto(A, B, ksi, xk, epsilon)
    s = 2;
    y0 = [B * pi, A * pi];
    delta = (1 / pi) ^ (s + 1) + sqrt(A ^ 2 * y0(2) * y0(2) + ...
        B ^ 2 * y0(1) * y0(1)) ^ (s + 1);
    h = (epsilon / delta) ^ (1 / (s + 1));
    b2 = 1. / (2. * ksi);
    b1 = 1 - b2;
    x = 0;
    y1 = B * pi;
    y2 = A * pi;   
    count = 2;
    
    while (x(end) < xk)
        
        if(x(end) + h > xk)
            h = xk - x(end);
        end
                
        [y1_h, y2_h] = nextYorder2(y1(count - 1), ...
            y2(count - 1), A, -B, h, ksi, b1, b2);     
        [y1_h_half_1, y2_h_half_1] = nextYorder2(y1(count - 1), ...
            y2(count - 1), A, -B, h / 2, ksi, b1, b2);  
        [y1_h_half_2, y2_h_half_2] = nextYorder2(y1_h_half_1, ...
            y2_h_half_1, A, -B, h / 2, ksi, b1, b2);
        
        r = ([y1_h_half_2; y2_h_half_2] - [y1_h; y2_h] )/ (1 - 2 ^ (-s));
        r_norm = sqrt(sum(r.^2));
        
        if (r_norm > epsilon * 2 ^ s)
            h = h / 2;
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
        count = count + 1;
    end
end

