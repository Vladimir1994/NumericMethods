function y = Lagrange(x_preset, y_preset, x)
    y = 0;
    N = length(x_preset); 
    for i = 1:N
        L = 1;
        for j = 1:N
            if(i ~= j)
                L = L.*((x - x_preset(j))./(x_preset(i) - x_preset(j)));
            end
        end
        y = y + y_preset(i)*L;
    end
end

