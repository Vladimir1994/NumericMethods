function [ y ] = F( x )
    y = 1.3 .* cos(3.5 .* x) .* exp(2 .* x ./ 3) + 6 ...
        .* sin(4.5 .* x) .* exp(-x ./ 8) + 5 .* x;
end

