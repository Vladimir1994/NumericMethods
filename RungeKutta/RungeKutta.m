function [x, y1, y2] = RungeKutta(A, B, ksi, xk, h, method)
    b2 = 1. / (2. * ksi);
    b1 = 1 - b2;
    x = 0;
    y1 = B * pi;
    y2 = A * pi;
    count = 1;
    while (x <= xk)
        count = count + 1;
        x(count) = x(count - 1) + h;  
        [y1(count), y2(count)] = method(y1(count - 1), y2(count - 1), A,...
                                        -B, h, ksi, b1, b2);        
    end
end

