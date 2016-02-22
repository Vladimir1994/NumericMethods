function [fragments] = fragmentation(start_interval, null_count)
    counter = 1;
    fragments = [0 0];
    counter_1 = 1;
    while(size(fragments, 1) < null_count)
        fragments = [0 0];
        for i = 1:2 ^ counter + 1;
            points(i) = start_interval(1) + (i - 1) * (start_interval(2) - ...
                 start_interval(1)) / (2 ^ counter);
        end
        for i = 1:(length(points) - 1)
            if(F(points(i)) * F(points(i + 1)) <= 0 && F(points(i)) ~= 0)
                fragments(counter_1, 1) = points(i);
                fragments(counter_1, 2) = points(i + 1);
                counter_1 = counter_1 + 1;
            end
        end
        counter_1 = 1;
        counter = counter + 1;
    end     
end